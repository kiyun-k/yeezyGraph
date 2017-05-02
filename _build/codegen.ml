(* Code generation: translate takes a semantically checked AST and
produces LLVM IR

LLVM tutorial: Make sure to read the OCaml version of the tutorial

http://llvm.org/docs/tutorial/index.html

Detailed documentation on the OCaml LLVM library:

http://llvm.moe/
http://llvm.moe/ocaml/

*)

module L = Llvm
module A = Ast
module StringMap = Map.Make(String)

let translate (globals, functions) =
  let context = L.global_context () in (* global data container *)
  let llctx = L.global_context () in 
  let the_module = L.create_module context "MicroC" in (* container *)
  let queuem = L.MemoryBuffer.of_file "queue.bc" in
  let qqm = Llvm_bitreader.parse_bitcode llctx queuem in
  let i32_t  = L.i32_type context 
  and i8_t   = L.i8_type context (* for printf format string *)
  and float_t  = L.double_type context 
  and i1_t   = L.i1_type context 
  and void_t = L.void_type context   
  and queueid_t = L.pointer_type (match L.type_by_name qqm "struct.QueueId" with 
    None -> raise (Invalid_argument "Option.get queueid") | Some x -> x) in 
  

  let ltype_of_typ = function (* LLVM type for a given AST type *)
      A.Int -> i32_t
    | A.Float -> float_t
    | A.Bool -> i1_t
    | A.String -> L.pointer_type i8_t
    | A.Void -> void_t 
    | A.QueueType _ -> queueid_t
    | A.AnyType -> L.pointer_type i8_t in 

  (* Declare and initialize each global variable; remember its value in a map *)
  let global_vars =
    let global_var m (t, n) =
      let init = L.const_null (ltype_of_typ t) 
      in StringMap.add n (L.define_global n init the_module) m in
    List.fold_left global_var StringMap.empty globals in

  (* Declare printf(), which the print built-in function will call *)
  let printf_t = L.var_arg_function_type i32_t [| L.pointer_type i8_t |] in (* Declare a function type *)
  let printf_func = L.declare_function "printf" printf_t the_module in

  (* Declare the built-in printbig() function *)
  let printbig_t = L.function_type i32_t [| i32_t |] in
  let printbig_func = L.declare_function "printbig" printbig_t the_module in

  (*Declare queue functions *)
  let initQueueId_t = L.function_type queueid_t [| |] in 
  let initQueueId_f = L.declare_function "initQueueId" initQueueId_t the_module in
  let enqueue_t = L.function_type void_t [| queueid_t; L.pointer_type i8_t|] in 
  let enqueue_f = L.declare_function "enqueue" enqueue_t the_module in
  let dequeue_t = L.function_type void_t [| queueid_t |] in 
  let dequeue_f = L.declare_function "dequeue" dequeue_t the_module in
  let front_t = L.function_type (L.pointer_type i8_t) [| queueid_t |] in
  let front_f = L.declare_function "front" front_t the_module in

  

  (* Define each user-defined function (arguments and return type); remember in a map *)
  let function_decls =
    let function_decl m fdecl =
      let name = fdecl.A.fname
      and formal_types = Array.of_list 
          (List.map (fun (t,_) -> ltype_of_typ t) fdecl.A.formals)
      in let ftype = 
          L.function_type (ltype_of_typ fdecl.A.typ) formal_types in
      StringMap.add name (L.define_function name ftype the_module, fdecl) m in
    List.fold_left function_decl StringMap.empty functions in
  
  (* Fill in the body of the given function *)
  let build_function_body fdecl =
    let (the_function, _) = StringMap.find fdecl.A.fname function_decls in
    let builder = L.builder_at_end context (L.entry_block the_function) in

    let int_format_str = L.build_global_stringptr "%d\n" "fmt" builder in 
    let float_format_str = L.build_global_stringptr "%f\n" "fmt" builder in
    
    (* Construct the function's "locals": formal arguments and locally
       declared variables.  Allocate each on the stack, initialize their
       value, if appropriate, and remember their values in the "locals" map *)
    let local_vars =
      let add_formal m (t, n) p = L.set_value_name n p;
	       let local = L.build_alloca (ltype_of_typ t) n builder in
	       ignore (L.build_store p local builder);
	       StringMap.add n local m in

      let add_local m (t, n) =
	       let local_var = L.build_alloca (ltype_of_typ t) n builder
	       in StringMap.add n local_var m in

      let formals = List.fold_left2 add_formal StringMap.empty fdecl.A.formals
          (Array.to_list (L.params the_function)) in
          List.fold_left add_local formals fdecl.A.locals in

    (* Return the value for a variable or formal argument *)
    let lookup n = try StringMap.find n local_vars
                   with Not_found -> StringMap.find n global_vars
    in

(*
    let get_type_from_expr expr = match expr with 
    A.IntLit(_) -> ltype_of_typ A.Int
    | A.BoolLit(_) -> ltype_of_typ A.Bool
    | A.StringLit(_) -> ltype_of_typ A.String
    | A.FloatLit(_) -> ltype_of_typ A.Float
    | A.Noexpr -> ltype_of_typ A.Void 
    | A.Id(s) -> ltype_of_typ A.Void
    | A.Binop(_, _, _) -> ltype_of_typ A.Void
    | A.Unop(_, _) -> ltype_of_typ A.Void 
    | A.Assign(_,_) -> ltype_of_typ A.Void 
    | A.Call(_,_) -> ltype_of_typ A.Void in 

*)
    let getQueueType = function
       A.Queue (typ, act) -> ignore(act); typ
      | _ -> A.Int

    in 

    (* Construct code for an expression; return its value *)
    let rec expr builder = function
	      A.IntLit i -> L.const_int i32_t i
      | A.BoolLit b -> L.const_int i1_t (if b then 1 else 0)
      | A.StringLit s -> L.build_global_stringptr s "str" builder
      | A.FloatLit f -> L.const_float float_t f
      | A.Noexpr -> L.const_int i32_t 0
      | A.Id s -> L.build_load (lookup s) s builder
      | A.Binop (e1, op, e2) ->
         let e1' = expr builder e1
	       and e2' = expr builder e2 
         in
         let t1 = L.type_of e1' in 
	       (match op with
	         A.Add     -> if t1 = float_t then L.build_fadd else L.build_add
	       | A.Sub     -> if t1 = float_t then L.build_fsub else L.build_sub
	       | A.Mult    -> if t1 = float_t then L.build_fmul else L.build_mul
         | A.Div     -> if t1 = float_t then L.build_fdiv else L.build_sdiv
	       | A.And     -> L.build_and
	       | A.Or      -> L.build_or
	       | A.Equal   -> if t1 = float_t then L.build_fcmp L.Fcmp.Oeq else L.build_icmp L.Icmp.Eq
	       | A.Neq     -> if t1 = float_t then L.build_fcmp L.Fcmp.One else L.build_icmp L.Icmp.Ne
	       | A.Less    -> if t1 = float_t then L.build_fcmp L.Fcmp.Olt else L.build_icmp L.Icmp.Slt
	       | A.Leq     -> if t1 = float_t then L.build_fcmp L.Fcmp.Ole else L.build_icmp L.Icmp.Sle
	       | A.Greater -> if t1 = float_t then L.build_fcmp L.Fcmp.Ogt else L.build_icmp L.Icmp.Sgt
	       | A.Geq     -> if t1 = float_t then L.build_fcmp L.Fcmp.Oge else L.build_icmp L.Icmp.Sge ) e1' e2' "tmp" builder
      | A.Unop(op, e) ->
	       let e' = expr builder e in
	       (match op with
	         A.Neg     -> L.build_neg
         | A.Not     -> L.build_not) e' "tmp" builder
      | A.Queue (typ, act) ->
        let d_ltyp = ltype_of_typ typ in
        let queue_ptr = L.build_call initQueueId_f [| |] "init" builder in 
        let add_element elem = 
          let d_ptr = match typ with 
          | A.QueueType _ -> expr builder elem 
          | _ -> 
            let element = expr builder elem in 
            let d_ptr = L.build_malloc d_ltyp "tmp" builder in 
            ignore (L.build_store element d_ptr builder); d_ptr in 
          let void_d_ptr = L.build_bitcast d_ptr (L.pointer_type i8_t) "ptr" builder in
          ignore (L.build_call enqueue_f [| queue_ptr; void_d_ptr |] "" builder)
        in ignore (List.map add_element act);
        queue_ptr

      | A.Assign (s, e) -> let e' = expr builder e in
	                   ignore (L.build_store e' (lookup s) builder); e'
      | A.Call ("print", [e]) | A.Call ("printb", [e]) ->
	       L.build_call printf_func [| int_format_str ; (expr builder e) |] "printf" builder
      | A.Call ("printfloat", [e]) -> L.build_call printf_func [| float_format_str; (expr builder e) |] "printf" builder
      | A.Call ("prints", [e]) -> 
         L.build_call printf_func [| expr builder e |] "printf" builder
      | A.Call ("printbig", [e]) ->
	       L.build_call printbig_func 
            [| (expr builder e) |] 
            "printbig" builder
      | A.ObjectCall (q, "qadd", [e]) -> 
        let q_val = expr builder q in
        let e_val = expr builder e in 
        let d_ltyp = L.type_of e_val in 
        let d_ptr = L.build_malloc d_ltyp "tmp" builder in 
        ignore(L.build_store e_val d_ptr builder);
        let void_e_ptr = L.build_bitcast d_ptr (L.pointer_type i8_t) "ptr" builder in 
        ignore (L.build_call enqueue_f [| q_val; void_e_ptr|] "" builder); q_val

      | A.ObjectCall (q, "qremove", [e]) -> 
        ignore(e);
        let q_val = expr builder q in
        ignore (L.build_call dequeue_f [| q_val|] "" builder); q_val

      | A.ObjectCall (q, "qfront", [e]) -> 
        ignore(e);
        let q_val = expr builder q
        and q_type = getQueueType q in 
        let val_ptr = L.build_call front_f [| q_val|] "val_ptr" builder in
        (match q_type with 
          A.QueueType _ ->
            let l_dtyp = ltype_of_typ q_type in 
            let void_d_ptr = L.build_load val_ptr "void_d_ptr" builder in
            (L.build_bitcast void_d_ptr l_dtyp "data" builder)
          | _ -> 
            let l_dtyp = ltype_of_typ q_type in 
            let d_ptr = L.build_bitcast val_ptr (L.pointer_type l_dtyp) "d_ptr" builder in
            (L.build_load d_ptr "d_ptr" builder))

  
       (* let val_data_ptr =  L.build_struct_gep val_ptr 0 "l_val_ptr" builder *)(*in 

        (match q_type with
          A.QueueType _ ->
            let l_dtyp = ltype_of_typ q_type in 
            let void_d_ptr = L.build_load val_data_ptr "void_d_ptr" builder in
            (L.build_bitcast void_d_ptr l_dtyp "data" builder)
        | _ -> 
          let l_dtyp = ltype_of_typ q_type in 
          let void_d_ptr = L.build_load val_data_ptr "void_d_ptr" builder in 
          let d_ptr = L.build_bitcast void_d_ptr (L.pointer_type l_dtyp) "d_ptr" builder in
          (L.build_load d_ptr "d_ptr" builder)) *)
     

      | A.Call (f, act) ->
         let (fdef, fdecl) = StringMap.find f function_decls in
	       let actuals = 
            List.rev (List.map (expr builder) (List.rev act)) in
	       let result = (match fdecl.A.typ with A.Void -> ""
                                              | _ -> f ^ "_result") in
         L.build_call fdef (Array.of_list actuals) result builder

      |  A.ObjectCall(_, f, act) -> 
         let (fdef, fdecl) = StringMap.find f function_decls in
         let actuals = 
            List.rev (List.map (expr builder) (List.rev act)) in
         let result = (match fdecl.A.typ with A.Void -> ""
                                              | _ -> f ^ "_result") in
         L.build_call fdef (Array.of_list actuals) result builder 
       
    in

    (* Invoke "f builder" if the current block doesn't already
       have a terminal (e.g., a branch). *)
    let add_terminal builder f =
      match L.block_terminator (L.insertion_block builder) with
	      Some _ -> ()
      | None -> ignore (f builder) in
	
    (* Build the code for the given statement; return the builder for
       the statement's successor *)
    let rec stmt builder = function
	      A.Block sl -> List.fold_left stmt builder sl
      | A.Expr e -> ignore (expr builder e); builder
      | A.Return e -> ignore (match fdecl.A.typ with
	         A.Void -> L.build_ret_void builder
	       | _ -> L.build_ret (expr builder e) builder); builder
      | A.If (predicate, then_stmt, else_stmt) ->
         let bool_val = expr builder predicate in
	       let merge_bb = L.append_block context "merge" the_function in
	       let then_bb = L.append_block context "then" the_function in
	       add_terminal (stmt (L.builder_at_end context then_bb) then_stmt) 
                      (L.build_br merge_bb);
	       let else_bb = L.append_block context "else" the_function in
	       add_terminal (stmt (L.builder_at_end context else_bb) else_stmt)
	                    (L.build_br merge_bb);
	       ignore (L.build_cond_br bool_val then_bb else_bb builder);
	       L.builder_at_end context merge_bb
      | A.While (predicate, body) ->
	        let pred_bb = L.append_block context "while" the_function in
	        ignore (L.build_br pred_bb builder);

	        let body_bb = L.append_block context "while_body" the_function in
	        add_terminal (stmt (L.builder_at_end context body_bb) body)
	                     (L.build_br pred_bb);

	        let pred_builder = L.builder_at_end context pred_bb in
	        let bool_val = expr pred_builder predicate in
	        
          let merge_bb = L.append_block context "merge" the_function in
	        ignore (L.build_cond_br bool_val body_bb merge_bb pred_builder);
	        L.builder_at_end context merge_bb

      | A.For (e1, e2, e3, body) -> stmt builder
	           ( A.Block [A.Expr e1 ; 
                        A.While (e2, A.Block [body ; 
                                              A.Expr e3]) ] )
    in

    (* Build the code for each statement in the function *)
    let builder = stmt builder (A.Block fdecl.A.body) in

    (* Add a return if the last block falls off the end *)
    add_terminal builder (match fdecl.A.typ with
        A.Void -> L.build_ret_void
      | t -> L.build_ret (L.const_int (ltype_of_typ t) 0))
  in

  List.iter build_function_body functions;
  the_module
