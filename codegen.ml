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

let translate (globals, functions, structs) =
  let context = L.global_context () in (* global data container *)
  let nodecontext = L.global_context () in
  let graphcontext = L.global_context () in
  let the_module = L.create_module context "MicroC" in(* container *)
  let llctx = L.global_context () in
  
  let qqctx = L.global_context () in
  let queuem = L.MemoryBuffer.of_file "queue.bc" in
  let listm = L.MemoryBuffer.of_file "linkedlist.bc" in
  let llm = Llvm_bitreader.parse_bitcode llctx listm in
  let qqm = Llvm_bitreader.parse_bitcode qqctx queuem in

  let ppctx = L.global_context () in
  let pqueuem = L.MemoryBuffer.of_file "pqueue.bc" in
  let ppm = Llvm_bitreader.parse_bitcode ppctx pqueuem in

  let nodem = L.MemoryBuffer.of_file "node.bc" in
  let node_module = Llvm_bitreader.parse_bitcode nodecontext nodem in
  let graphm = L.MemoryBuffer.of_file "graph.bc" in
  let graph_module = Llvm_bitreader.parse_bitcode graphcontext graphm in

  let i32_t  = L.i32_type  context
  and i8_t   = L.i8_type   context (* for printf format string *)
  and float_t  = L.double_type context
  and i1_t   = L.i1_type   context
  and void_t = L.void_type context
  and queueid_t = L.pointer_type (match L.type_by_name qqm "struct.QueueId" with
    None -> raise (Invalid_argument "Option.get queueid") | Some x -> x)
  and pqueue_t = L.pointer_type (match L.type_by_name ppm "struct.pqueue" with
    None -> raise (Invalid_argument "Option.get pqueue") | Some x -> x)
  and graph_t = L.pointer_type (match L.type_by_name graph_module "struct.graph" with
    None -> raise (Invalid_argument "Option.get graph") | Some x -> x )
  and node_t = L.pointer_type (match L.type_by_name node_module "struct.node" with
    None -> raise (Invalid_argument "Option.get node") | Some x -> x )
  and list_t = L.pointer_type (match L.type_by_name llm "struct.List" with
    None -> raise (Invalid_argument "Option.get struct.List") | Some x -> x) in


let struct_types =
  let add_struct m sdecl = 
    let struct_t = L.named_struct_type context sdecl.A.sname 
    in StringMap.add sdecl.A.sname struct_t m in
  List.fold_left add_struct StringMap.empty structs in


  let ltype_of_typ = function (* LLVM type for a given AST type *)
      A.Int -> i32_t
    | A.Float -> float_t
    | A.Bool -> i1_t
    | A.String -> L.pointer_type i8_t
    | A.Void -> void_t 
    | A.StructType s -> (try StringMap.find s struct_types with Not_found -> raise (Failure("struct type " ^ s ^ " is undefined") ))
    | A.GraphType _ -> graph_t
    | A.NodeType _  -> node_t 
    | A.QueueType _ -> queueid_t
    | A.PQueueType -> pqueue_t
    | A.ListType _ -> list_t
    | A.AnyType -> L.pointer_type i8_t in



  (* Build struct body*)
  let build_struct_body sdecl = 
    let struct_t = StringMap.find sdecl.A.sname struct_types in
    let element_list = Array.of_list(List.map (fun (t, _) -> ltype_of_typ t) sdecl.A.sformals) in
    L.struct_set_body struct_t element_list true in
    ignore(List.map build_struct_body structs);


  (* struct_indexing_map(struct_type -> field_indexing_map *)
  (* field_indexing_map(field_name -> index) *)
  let struct_indexing_map =
    let fill_struct_indexing_map m this_struct = 
      let field_name_list = List.map snd this_struct.A.sformals in
      let add_one i = i + 1 in
      let fill_field_indexing_map (m, i) field_name = StringMap.add field_name (add_one i) m, add_one i in
      let field_indexing_map = List.fold_left fill_field_indexing_map (StringMap.empty, -1) field_name_list in
      StringMap.add this_struct.A.sname (fst field_indexing_map) m  
    in
    List.fold_left fill_struct_indexing_map StringMap.empty structs  
  in



  (* Declare and initialize each global variable; remember its value in a map *)
  let global_types = 
    let global_type m (t, n) = StringMap.add n t m in 
    List.fold_left global_type StringMap.empty globals in

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


  (* built-in queue functions *)
  let initQueueId_t = L.function_type queueid_t [| |] in 
  let initQueueId_f = L.declare_function "initQueueId" initQueueId_t the_module in
  let enqueue_t = L.function_type void_t [| queueid_t; L.pointer_type i8_t|] in 
  let enqueue_f = L.declare_function "enqueue" enqueue_t the_module in
  let dequeue_t = L.function_type void_t [| queueid_t |] in 
  let dequeue_f = L.declare_function "dequeue" dequeue_t the_module in
  let front_t = L.function_type (L.pointer_type i8_t) [| queueid_t |] in
  let front_f = L.declare_function "front" front_t the_module in

  (* built-in linked list functions *)
  let initList_t = L.function_type list_t [| |] in
  let initList_f = L.declare_function "l_init" initList_t the_module in
  let addList_t = L.function_type void_t [| list_t; (L.pointer_type i8_t) |] in
  let addList_f = L.declare_function "l_add" addList_t the_module in 
  let delList_t = L.function_type void_t [| list_t; i32_t |] in
  let delList_f = L.declare_function "l_delete" delList_t the_module in
  let getList_t = L.function_type (L.pointer_type i8_t) [| list_t; i32_t |] in
  let getList_f = L.declare_function "l_get" getList_t the_module in 
  let sizeList_t = L.function_type i32_t [| list_t|] in 
  let sizeList_f = L.declare_function "l_size" sizeList_t the_module in 
  let printList_t = L.function_type void_t [| list_t|] in 
  let printList_f = L.declare_function "print_list" printList_t the_module in 

  (* Pqueue functions *)
  let initPQueue_t = L.function_type pqueue_t [| |] in
  let initPQueue_f = L.declare_function "pq_init" initPQueue_t the_module in
  let pushPQ_t = L.function_type void_t [| pqueue_t; node_t |] in 
  let pushPQ_f = L.declare_function "pq_push" pushPQ_t the_module in 
  let deletePQ_t = L.function_type node_t [| pqueue_t |] in 
  let deletePQ_f = L.declare_function "pq_delete" deletePQ_t the_module in 
  let sizePQ_t = L.function_type i32_t [| pqueue_t |] in 
  let sizePQ_f = L.declare_function "p_size" sizePQ_t the_module in 

  (* Node functions *)
  let initNode_t = L.function_type node_t [| L.pointer_type i8_t |] in
  let initNode_f = L.declare_function "n_init" initNode_t the_module in
  let setData_t = L.function_type void_t [| node_t; L.pointer_type i8_t|] in 
  let setData_f = L.declare_function "set_data" setData_t the_module in 
  let getName_t = L.function_type (L.pointer_type i8_t) [| node_t |] in 
  let getName_f = L.declare_function "get_name" getName_t the_module in 
  let getVisited_t = L.function_type i1_t [| node_t |] in
  let getVisited_f = L.declare_function "get_visited" getVisited_t the_module in 
  let modifyVisited_t = L.function_type void_t [| node_t; i1_t|] in
  let modifyVisited_f = L.declare_function "modify_visited" modifyVisited_t the_module in 
  let getData_t = L.function_type (L.pointer_type i8_t) [| node_t |] in 
  let getData_f = L.declare_function "get_data" getData_t the_module in 
  let getinNodes_t = L.function_type (list_t) [| node_t |] in 
  let getinNodes_f = L.declare_function "get_inNodes" getinNodes_t the_module in 
  let getoutNodes_t = L.function_type (list_t) [| node_t |] in 
  let getoutNodes_f = L.declare_function "get_outNodes" getoutNodes_t the_module in 



  (* Graph functions *)
  let initGraph_t = L.function_type graph_t [| |] in
  let initGraph_f = L.declare_function "g_init" initGraph_t the_module in
  let addNode_t = L.function_type void_t [| graph_t; node_t |] in
  let addNode_f = L.declare_function "addNode" addNode_t the_module in
  let removeNode_t = L.function_type void_t [| graph_t; node_t |] in
  let removeNode_f = L.declare_function "removeNode" removeNode_t the_module in
  let addEdge_t = L.function_type void_t [| graph_t; node_t; node_t; i32_t |] in
  let addEdge_f = L.declare_function "addEdge" addEdge_t the_module in
  let removeEdge_t = L.function_type void_t [| graph_t; node_t; node_t |] in
  let removeEdge_f = L.declare_function "removeEdge" removeEdge_t the_module in
  let removeAllNodes_t = L.function_type void_t [| graph_t|] in 
  let removeAllNodes_f = L.declare_function "removeAllNodes" removeAllNodes_t the_module in
  let printGraph_t = L.function_type void_t [| graph_t|] in 
  let printGraph_f = L.declare_function "printGraph" printGraph_t the_module in 
  let isEmpty_t = L.function_type i1_t [| graph_t|] in 
  let isEmpty_f = L.declare_function "isEmpty" isEmpty_t the_module in 
  let size_t = L.function_type i32_t [| graph_t|] in 
  let size_f = L.declare_function "size" size_t the_module in 
  let contains_t = L.function_type i1_t [| graph_t; L.pointer_type i8_t|] in 
  let contains_f = L.declare_function "contains" contains_t the_module in 
  let getNode_t = L.function_type node_t [| graph_t; L.pointer_type i8_t|] in 
  let getNode_f = L.declare_function "getNode" getNode_t the_module in 
  let getWeight_t = L.function_type i32_t [| graph_t; node_t; node_t|] in 
  let getWeight_f = L.declare_function "getWeight" getWeight_t the_module in 




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
    let str_format_str = L.build_global_stringptr "%s\n" "fmt" builder in 

    let int_format_str2 = L.build_global_stringptr "%d" "fmt" builder in 
    let str_format_str2 = L.build_global_stringptr "%s" "fmt" builder in 

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


    let local_types = 
      let add_type m (t, n) = StringMap.add n t m in 
      let formal_types = List.fold_left add_type StringMap.empty fdecl.A.formals in
          List.fold_left add_type formal_types fdecl.A.locals in


    (* Return the value for a variable or formal argument *)
    let lookup n = try StringMap.find n local_vars
                   with Not_found -> StringMap.find n global_vars
    in

    let lookup_types n = try StringMap.find n local_types
                         with Not_found -> StringMap.find n global_types in


    let getQueueType = function
       A.QueueType(typ) -> typ
      | _ -> A.Void in 

    let getListType = function
      A.ListType(typ) -> typ
    | _ -> A.String in

    let getNodeType = function
       A.NodeType(typ) -> typ
      | _ -> A.Void in 

    let idtostring = function 
        A.Id s -> s 
      | _ -> "" in 


    (* Construct code for an expression; return its value *)
    let rec expr builder = function
	      A.IntLit i -> L.const_int i32_t i
      | A.BoolLit b -> L.const_int i1_t (if b then 1 else 0)
      | A.StringLit s -> L.build_global_stringptr s "str" builder
      | A.FloatLit f -> L.const_float float_t f
      | A.Noexpr -> L.const_int i32_t 0
      | A.Id s -> L.build_load (lookup s) s builder
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
      | A.List (typ, act) -> 
        let d_ltyp = ltype_of_typ typ in
        let listptr = L.build_call initList_f [||] "init" builder in
          let add_elmt elmt = 
            let d_ptr = match typ with
            A.ListType _ -> expr builder elmt
          | _ ->
            let d_val = expr builder elmt in
            let d_ptr = L.build_malloc d_ltyp "tmp" builder in
            ignore (L.build_store d_val d_ptr builder);
            d_ptr in

            let void_d_ptr = L.build_bitcast d_ptr (L.pointer_type i8_t) "ptr" builder in
            ignore (L.build_call addList_f [| listptr; void_d_ptr |] "" builder) in
          ignore (List.map add_elmt act);
        listptr
      | A.PQueue (act) -> 
        let pqptr = L.build_call initPQueue_f [| |] "init" builder in 
          let add_elmt elmt = 
            let element = expr builder elmt in
          ignore (L.build_call pushPQ_f [| pqptr; element |] "" builder) in 
        ignore (List.map add_elmt act);
        pqptr
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

      | A.NodeOp(e, nop, s ) -> 
          let e_val = expr builder e in 
          let s_val = lookup s in 
          (match nop with 
            A.AccessNode -> 
           let char_s_val_pointer = L.build_load s_val "char_n_val_pointer" builder in 
           let node_pointer = L.build_call getNode_f [| e_val; char_s_val_pointer|] "" builder in 
           node_pointer 
          )

      | A.NodeOp2(e, nop2) -> 
            let e_val = expr builder e in 

            let n_type = getNodeType(lookup_types(idtostring e)) in 
            (match nop2 with 
              A.GetName -> 
                let c_pointer = L.build_call getName_f [| e_val |] "getName" builder in c_pointer
            | A.GetVisited ->
                let b_pointer = L.build_call getVisited_f [| e_val |] "getVisited" builder in b_pointer
            | A.GetData ->
                let v_pointer = L.build_call getData_f [| e_val |] "getData" builder in 
                let l_dtyp = ltype_of_typ n_type in
                let d_ptr = L.build_bitcast v_pointer (L.pointer_type l_dtyp) "d_ptr" builder in
                (L.build_load d_ptr "d_ptr" builder)
            | A.GetinNodes ->
                let v_pointer = L.build_call getinNodes_f [| e_val |] "getinNodes" builder in v_pointer 
            
            | A.GetoutNodes ->
                let v_pointer = L.build_call getoutNodes_f [| e_val |] "getOutNodes" builder in 
                v_pointer)
            
      | A.Node(n, _) -> 
          let n_val = lookup n in 
          let char_n_val_pointer = L.build_load n_val "char_n_val_pointer" builder in 
          let nodeptr = L.build_call initNode_f [| char_n_val_pointer |] "init_n" builder in nodeptr 

      | A.Graph(_) -> 
          let graphptr = L.build_call initGraph_f [| |] "init" builder in graphptr
          
      | A.GraphOp(g, gop, n) ->
          let g_val = lookup g in 
          let n_val = lookup n in  
          let char_n_val_pointer = L.build_load n_val "char_n_val_pointer" builder in 

          (match gop with
           A.AddNode -> 
           
           let n_ptr = L.build_call initNode_f [| char_n_val_pointer |] "init" builder in 
           let n_val_ptr = L.build_alloca (L.type_of n_ptr) "node_alloca" builder in 
           ignore (L.build_store n_ptr n_val_ptr builder); 
           let graph_pointer = L.build_load g_val "graph_pointer" builder in 
           let node_pointer = L.build_load n_val_ptr "node_pointer" builder in 
           ignore(L.build_call addNode_f [| graph_pointer; node_pointer |] "" builder); g_val 
          | A.RemoveNode ->
           let n_ptr = L.build_call initNode_f [| char_n_val_pointer |] "init" builder in 
           let n_val_ptr = L.build_alloca (L.type_of n_ptr) "node_alloca" builder in 
           ignore (L.build_store n_ptr n_val_ptr builder); 
           let graph_pointer = L.build_load g_val "graph_pointer" builder in 
           let node_pointer = L.build_load n_val_ptr "node_pointer" builder in 
           ignore(L.build_call removeNode_f [| graph_pointer; node_pointer |] "" builder); g_val 
          
         )
      | A.GraphOpAddEdge(g, i, gop2, e1, e2) ->
        (match gop2 with
          A.AddEdge ->  
          let g_val = expr builder g in 
          let i_val = L.const_int i32_t i in 
          let e1_val = lookup e1 in 
          let e1_val_pointer = L.build_load e1_val "e1_val_pointer" builder in 
          let e2_val = lookup e2 in 
          let e2_val_pointer = L.build_load e2_val "e2_val_pointer" builder in 
          let g_pointer = L.build_call addEdge_f [| g_val; e1_val_pointer; e2_val_pointer; i_val|] "" builder in g_pointer
        )

      | A.GraphOpRemoveEdge(g, gop3, e1, e2) ->
        (match gop3 with
          A.RemoveEdge ->  
          let g_val = lookup g in
          let g_val_pointer = L.build_load g_val "g_val_pointer" builder in  
          let e1_val = lookup e1 in 
          let e1_val_pointer = L.build_load e1_val "e1_val_pointer" builder in 
          let e2_val = lookup e2 in 
          let e2_val_pointer = L.build_load e2_val "e2_val_pointer" builder in 
          let g_pointer = L.build_call removeEdge_f [| g_val_pointer; e1_val_pointer; e2_val_pointer|] "" builder in g_pointer
        )
        
      | A.AccessStructField(e, field_name) -> 
        (match e with 
           A.Id s -> let etype = fst(List.find (fun local -> snd(local) = s) fdecl.A.locals) in
              (match etype with
                  A.StructType struct_type ->
                    let field_indexing_map = StringMap.find struct_type struct_indexing_map in
                    let index = StringMap.find field_name field_indexing_map in
                    let struct_llvalue = lookup s in
                    (* %struct_field_pointer = getelementptr %struct_llvalue, 0, index_number*)
                    let struct_field_pointer = L.build_struct_gep struct_llvalue index "struct_field_pointer" builder in
                    (* %struct_field_value = load %struct_field_pointer*)
                    let struct_field_value = L.build_load struct_field_pointer "struct_field_value" builder in
                    struct_field_value
                | _ -> raise (Failure("AccessStructField failed: " ^ s ^ "is not a struct type")))
         | _ -> raise (Failure("AccessStructField failed")))


      | A.Assign (e1, e2) -> let e2' = expr builder e2 in
        (match e1 with
          A.Id s -> ignore (L.build_store e2' (lookup s) builder); e2'
        | A.AccessStructField(e, field_name) ->
          (match e with 
            A.Id s -> let etype = fst(List.find (fun local -> snd(local) = s) fdecl.A.locals) in
              (match etype with
                 A.StructType struct_type ->
                  let field_indexing_map = StringMap.find struct_type struct_indexing_map in
                  let index = StringMap.find field_name field_indexing_map in
                  let struct_llvalue = lookup s in
                  let struct_field_pointer = L.build_struct_gep struct_llvalue index "struct_field_pointer" builder in
                  ignore(L.build_store e2' struct_field_pointer builder); e2'
                | _ -> raise (Failure("AccessStructField failed: " ^ s ^ "is not a struct type")))
          | _ -> raise (Failure("AccessStructField failed")))
        | _ -> raise (Failure("Assign failed")))

      | A.Call ("print", [e]) | A.Call ("printb", [e]) ->
	       L.build_call printf_func [| int_format_str ; (expr builder e) |] "printf" builder
      | A.Call ("printfloat", [e]) -> L.build_call printf_func [| float_format_str; (expr builder e) |] "printf" builder
      | A.Call ("prints", [e]) -> 
         L.build_call printf_func [| str_format_str; (expr builder e) |] "printf" builder
      | A.Call ("printint", [e]) ->  L.build_call printf_func [| int_format_str2; (expr builder e) |] "printf" builder
      | A.Call ("printstring", [e]) ->  L.build_call printf_func [| str_format_str2; (expr builder e) |] "printf" builder

      | A.Call (f, act) ->
         let (fdef, fdecl) = StringMap.find f function_decls in
	       let actuals = 
            List.rev (List.map (expr builder) (List.rev act)) in
	       let result = (match fdecl.A.typ with A.Void -> ""
                                              | _ -> f ^ "_result") in
         L.build_call fdef (Array.of_list actuals) result builder

      | A.ObjectCall (g, "printGraph", []) -> let g_val = expr builder g in 
        ignore(L.build_call printGraph_f [| g_val |] "" builder); g_val

      | A.ObjectCall (l, "printList", []) -> let l_val = expr builder l in 
        ignore(L.build_call printList_f [| l_val |] "" builder); l_val

      | A.ObjectCall (l, "lsize", []) -> let l_val = expr builder l in 
        let size_ptr = L.build_call sizeList_f [| l_val |] "" builder; in size_ptr


      | A.ObjectCall(g, "isEmpty", []) -> let g_val = expr builder g in 
        let bool_ptr = L.build_call isEmpty_f [| g_val |] "isEmpty" builder in 
        bool_ptr

      | A.ObjectCall(g, "size", []) -> let g_val = expr builder g in 
        let size_ptr = L.build_call size_f [| g_val |] "isEmpty" builder in 
        size_ptr

      | A.ObjectCall(g, "weight", [e1; e2]) -> let g_val = expr builder g in 
        let e1' = expr builder e1 in 
        let e2' = expr builder e2 in 
        let weight_ptr = L.build_call getWeight_f [| g_val; e1'; e2' |] "getWeight" builder in 
        weight_ptr 

      (* NEEDS TO BE FIXED *)
      | A.ObjectCall(g, "removeAllNodes", []) -> let g_val = expr builder g in 
        ignore(L.build_call removeAllNodes_f [| g_val |] "" builder); g_val

      | A.ObjectCall(n, "modifyVisited", [e]) -> let n_val = expr builder n in 
        let bool_visited = expr builder e in 
        ignore(L.build_call modifyVisited_f [| n_val; bool_visited|] "" builder); n_val

      | A.ObjectCall(g, "contains", [e]) -> let g_val = expr builder g in 
        let e_val = expr builder e in 
        let bool_ptr = L.build_call contains_f [| g_val; e_val |] "contains" builder in bool_ptr 

      | A.ObjectCall(g, "setData", [e]) -> let g_val = expr builder g in 
        let e_val = expr builder e in  
        let d_typ = L.type_of e_val in 
        let d_ptr = L.build_malloc d_typ "tmp" builder in 
        ignore(L.build_store e_val d_ptr builder); 
        let e_val_ptr = L.build_bitcast d_ptr (L.pointer_type i8_t) "ptr" builder in 
        ignore(L.build_call setData_f [| g_val; e_val_ptr |] "" builder); g_val 

      | A.ObjectCall (q, "qadd", [e]) -> 
        let q_val = expr builder q in
        let e_val = expr builder e in 
        let d_ltyp = L.type_of e_val in 
        let d_ptr = L.build_malloc d_ltyp "tmp" builder in 
        ignore(L.build_store e_val d_ptr builder); 
        let void_e_ptr = L.build_bitcast d_ptr (L.pointer_type i8_t) "ptr" builder in 
        ignore (L.build_call enqueue_f [| q_val; void_e_ptr|] "" builder); q_val

      | A.ObjectCall (q, "qremove", []) -> 
        let q_val = expr builder q in
        ignore (L.build_call dequeue_f [| q_val|] "" builder); q_val

      | A.ObjectCall (q, "qfront", []) -> 
        let q_val = expr builder q in 
        let n = idtostring q in
        let q_type = getQueueType (lookup_types n) in 
        let val_ptr = L.build_call front_f [| q_val |] "val_ptr" builder in
        let l_dtyp = ltype_of_typ q_type in
        let d_ptr = L.build_bitcast val_ptr (L.pointer_type l_dtyp) "d_ptr" builder in
        (L.build_load d_ptr "d_ptr" builder)
      |  A.ObjectCall (p, "p_push", [e]) ->
        let pqptr = expr builder p in
        let e_val = expr builder e in
        ignore (L.build_call pushPQ_f [| pqptr; e_val |] "" builder);
        pqptr
      |  A.ObjectCall (p, "p_delete", []) ->
        let pqptr = expr builder p in
        let nodeptr = L.build_call deletePQ_f [| pqptr |] "data" builder in
        nodeptr
      | A.ObjectCall (p, "p_size", []) ->
        let pqptr = expr builder p in
        let size_ptr = L.build_call sizePQ_f [| pqptr |] "isEmpty" builder in
        size_ptr

      | A.ObjectCall (l, "l_add", [e]) ->
        let l_ptr = expr builder l in
        let e_val = expr builder e in
        let d_ltyp = L.type_of e_val in
        let d_ptr = L.build_malloc d_ltyp "tmp" builder in
          ignore(L.build_store e_val d_ptr builder);
        let void_e_ptr = L.build_bitcast d_ptr (L.pointer_type i8_t) "ptr" builder in
        ignore (L.build_call addList_f [| l_ptr ; void_e_ptr |] "" builder);
        l_ptr
      | A.ObjectCall (l, "l_delete", [e]) ->
        let l_ptr = expr builder l in 
        let e_val = expr builder e in
        ignore (L.build_call delList_f [| l_ptr; e_val |] "" builder);
        l_ptr
        
      (* TO BE INCORPORATED WITH INT *)
      | A.ObjectCall (l, "l_get", [e]) ->
        let l_ptr = expr builder l in
        let e_val = expr builder e in
        let n = idtostring l in
        let l_type = getListType (lookup_types n) in
        let val_ptr = L.build_call getList_f [| l_ptr; e_val |] "val_ptr" builder in
        val_ptr
      |  A.ObjectCall(_, f, act) -> 
         let (fdef, fdecl) = StringMap.find f function_decls in
         let actuals = 
            List.rev (List.map (expr builder) (List.rev act)) in
         let result = (match fdecl.A.typ with A.Void -> ""
                                              | _ -> f ^ "_result") in
         L.build_call fdef (Array.of_list actuals) result builder 

      | A.Infinity -> L.const_int i32_t (1000000)
      | A.NegInfinity -> L.const_int i32_t (-1000000)

         
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
