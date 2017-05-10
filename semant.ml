(* Semantic checking for the MicroC compiler *)

open Ast


module StringMap = Map.Make(String)

(* Semantic checking of a program. Returns void if successful,
   throws an exception if something is wrong.

   Check each global variable, then check each function *)

let check (globals, functions, structs) =

  (* Raise an exception if the given list has a duplicate *)
  let report_duplicate exceptf list =
    let rec helper = function
	     n1 :: n2 :: _ when n1 = n2 -> raise (Failure (exceptf n1))
      | _ :: t -> helper t
      | [] -> ()
    in helper (List.sort compare list)
  in

  (* Raise an exception if a given binding is to a void type *)
  let check_not_void exceptf = function
      (Void, n) -> raise (Failure (exceptf n))
    | _ -> ()
  in
  
  (* Raise an exception of the given rvalue type cannot be assigned to
     the given lvalue type *)
  let check_assign lvaluet rvaluet err =
     if (lvaluet) = (rvaluet) then lvaluet else raise err
  in
   



  (**** Checking Global Variables ****)

  List.iter (check_not_void (fun n -> "illegal void global " ^ n)) globals;
   
  report_duplicate (fun n -> "duplicate global " ^ n) (List.map snd globals);




  (**** Checking Structs ****)
  report_duplicate (fun n -> "duplicate struct type " ^ n)
    (List.map (fun sd -> sd.sname) structs);




  (**** Checking Functions ****)

  if List.mem "print" (List.map (fun fd -> fd.fname) functions)
  then raise (Failure ("function print may not be defined")) else ();

  if List.mem "printfloat" (List.map (fun fd -> fd.fname) functions)
  then raise (Failure ("function printfloat may not be defined")) else ();

  if List.mem "printb" (List.map (fun fd -> fd.fname) functions)
  then raise (Failure ("function printb may not be defined")) else ();

  if List.mem "prints" (List.map (fun fd -> fd.fname) functions)
  then raise (Failure ("function prints may not be defined")) else ();

  if List.mem "qremove" (List.map (fun fd -> fd.fname) functions)
  then raise (Failure ("function qremove may not be defined")) else ();

  if List.mem "qadd" (List.map (fun fd -> fd.fname) functions)
  then raise (Failure ("function qadd may not be defined")) else ();

  if List.mem "qfront" (List.map (fun fd -> fd.fname) functions)
  then raise (Failure ("function qfront may not be defined")) else ();

  if List.mem "p_push" (List.map (fun fd -> fd.fname) functions)
  then raise (Failure ("function p_push may not be defined")) else ();
  if List.mem "l_add" (List.map (fun fd -> fd.fname) functions)
  then raise (Failure ("function l_add may not be defined")) else ();

  if List.mem "p_delete" (List.map (fun fd -> fd.fname) functions)
  then raise (Failure ("function p_delete may not be defined")) else ();

  if List.mem "p_size" (List.map (fun fd -> fd.fname) functions)
  then raise (Failure ("function p_size may not be defined")) else ();


  report_duplicate (fun n -> "duplicate function " ^ n)
    (List.map (fun fd -> fd.fname) functions);

  (* Function declaration for a named function *)
  let built_in_decls =  StringMap.add "print"
     { typ = Void; fname = "print"; formals = [(Int, "x")];
       locals = []; body = [] }

       (StringMap.add "printint"
    { typ = Void; fname = "printint"; formals = [(Int, "x")];
       locals = []; body = [] } 

       (StringMap.add "printfloat"
     { typ = Void; fname = "printfloat"; formals = [(Float, "x")];
       locals = []; body = [] } 

       (StringMap.add "printb"
     { typ = Void; fname = "printb"; formals = [(Bool, "x")];
       locals = []; body = [] } 

       (StringMap.add "prints"
     { typ = Void; fname = "prints"; formals = [(String, "x")];
       locals = []; body = [] } 

      (StringMap.add "printstring"
     { typ = Void; fname = "printstring"; formals = [(String, "x")];
       locals = []; body = [] } 

       (StringMap.add "printbig"
     { typ = Void; fname = "printbig"; formals = [(Int, "x")];
       locals = []; body = [] }

      (StringMap.add "modifyVisited"
     { typ = Void; fname = "modifyVisited"; formals = [(Bool, "x")];
       locals = []; body = [] }

      (StringMap.add "printGraph"
     { typ = Void; fname = "printGraph"; formals = [];
       locals = []; body = [] }

      (StringMap.add "printList"
     { typ = Void; fname = "printList"; formals = [];
       locals = []; body = [] }

      (StringMap.add "isEmpty"
     { typ = Bool; fname = "isEmpty"; formals = [];
       locals = []; body = [] }

      (StringMap.add "size"
     { typ = Int; fname = "size"; formals = [];
       locals = []; body = [] }

      (StringMap.add "lsize"
     { typ = Int; fname = "lsize"; formals = [];
       locals = []; body = [] }


      (StringMap.add "weight"
     { typ = Int; fname = "weight"; formals = [(AnyType, "x"); (AnyType, "x")];
       locals = []; body = [] }

      (StringMap.add "contains"
     { typ = Bool; fname = "isEmpty"; formals = [(String, "x")];
       locals = []; body = [] }

      (StringMap.add "setData"
     { typ = Void; fname = "setData"; formals = [(AnyType, "x")];
       locals = []; body = [] }

       (StringMap.add "removeAllNodes"
     { typ = Void; fname = "removeAllNodes"; formals = [];
       locals = []; body = [] }

       (StringMap.add "p_push"
     { typ = Void; fname = "p_push"; formals = [(AnyType, "x")];
       locals = []; body = [] }

       (StringMap.add "p_delete"
     { typ = AnyType; fname = "p_delete"; formals = [];
       locals = []; body = [] }

       (StringMap.add "p_size"
     { typ = Int; fname = "p_size"; formals = [];
       locals = []; body = [] }

       (StringMap.add "qremove"
     { typ = Void; fname = "qremove"; formals = [];
       locals = []; body = [] }

       (StringMap.add "qadd"
     { typ = QueueType(AnyType); fname = "qadd"; formals = [(AnyType, "x")];
       locals = []; body = [] }

       (StringMap.add "qfront"
     { typ = AnyType; fname = "qfront"; formals = [];
       locals = []; body = [] }

      (StringMap.add "qsize"
     { typ = Int; fname = "qsize"; formals = [];
       locals = []; body = [] }

       (StringMap.add "l_add"
     { typ = Void; fname = "l_add"; formals = [(AnyType, "x")];
       locals = []; body = [] }

       (StringMap.add "l_delete"
     { typ = Void; fname = "l_delete"; formals = [(Int, "x")];
       locals = []; body = [] }

       (StringMap.singleton "l_get"
     { typ = AnyType; fname = "l_get"; formals = [(Int, "x")];
       locals = []; body = [] }


     ))))))))))))))))))))))))))

     
   in
     
  let function_decls = List.fold_left (fun m fd -> StringMap.add fd.fname fd m)
                         built_in_decls functions
  in

  let function_decl s = try StringMap.find s function_decls
       with Not_found -> raise (Failure ("unrecognized function " ^ s))
  in

  let _ = function_decl "main" in (* Ensure "main" is defined *)


  
  let check_AccessStructField struct_name field_name = 
    match struct_name with
        StructType struct_type -> 
          (let the_struct_type = try List.find (fun s -> s.sname = struct_type) structs 
                                 with Not_found -> raise (Failure("struct type " ^ struct_type ^ " is undefined")) in
          try fst( List.find (fun s -> snd(s) = field_name) the_struct_type.sformals) 
          with Not_found -> raise (Failure("struct " ^ struct_type ^ " does not contain field " ^ field_name)))       
      | _ -> raise (Failure(string_of_typ struct_name ^ " is not a struct type"))
  in




  let check_function func =

    List.iter (check_not_void (fun n -> "illegal void formal " ^ n ^
      " in " ^ func.fname)) func.formals;

    report_duplicate (fun n -> "duplicate formal " ^ n ^ " in " ^ func.fname)
      (List.map snd func.formals);

    List.iter (check_not_void (fun n -> "illegal void local " ^ n ^
      " in " ^ func.fname)) func.locals;

    report_duplicate (fun n -> "duplicate local " ^ n ^ " in " ^ func.fname)
      (List.map snd func.locals);

    (* Type of each variable (global, formal, or local *)
    let symbols = List.fold_left (fun m (t, n) -> StringMap.add n t m)
	                               StringMap.empty 
                                 (globals @ func.formals @ func.locals )
    in

    let type_of_identifier s =
      try StringMap.find s symbols
      with Not_found -> raise (Failure ("undeclared identifier " ^ s))
    in

    let getQueueType = function
       QueueType(typ) -> typ
      | _ -> Void  
    in 

     let getNodeType = function
       NodeType(typ) -> typ
      | _ -> Void 
    in 

    



    let getListType = function
       ListType(typ) -> typ
      | _ -> String 
    in 

    (* Return the type of an expression or throw an exception *)
    let rec expr = function
	      IntLit _ -> Int
      | Infinity -> Int
      | NegInfinity -> Int
      | BoolLit _ -> Bool
      | FloatLit _ -> Float
      | StringLit _ -> String
      | Queue (t, _) -> QueueType(t)
      | List (t,_) -> ListType(t) 
      | PQueue _ -> PQueueType
      | Node(_, t) -> NodeType(t)
      | Id s -> type_of_identifier s
      | Graph(t) -> GraphType(t)
      | Binop(e1, op, e2) as e -> let t1 = expr e1 
                                  and t2 = expr e2 in
	      (match op with
            Add       when t1 = Float && t2 = Float -> Float
          | Add       when t1 = Int && t2 = Int -> Int
          | And       when t1 = Bool && t2 = Bool -> Bool
          | Div       when t1 = Float && t2 = Float -> Float
          | Div       when t1 = Int && t2 = Int -> Int
          | Equal     when t1 = t2 -> Bool
          | Geq       when t1 = Float && t2 = Float -> Bool
          | Geq       when t1 = Int && t2 = Int -> Bool
          | Greater   when t1 = Float && t2 = Float -> Bool
          | Greater   when t1 = Int && t2 = Int -> Bool
          | Leq       when t1 = Float && t2 = Float -> Bool
          | Leq       when t1 = Int && t2 = Int -> Bool
          | Less      when t1 = Float && t2 = Float -> Bool
          | Less      when t1 = Int && t2 = Int -> Bool
          | Mult      when t1 = Float && t2 = Float -> Float
          | Mult      when t1 = Int && t2 = Int -> Int
          | Neq    when t1 = t2 -> Bool
          | Or        when t1 = Bool && t2 = Bool -> Bool
          | Sub       when t1 = Float && t2 = Float -> Float
          | Sub       when t1 = Int && t2 = Int -> Int
          | _ -> raise (Failure ("illegal binary operator " ^
              string_of_typ t1 ^ " " ^ string_of_op op ^ " " ^
              string_of_typ t2 ^ " in " ^ string_of_expr e)))

      | Unop(op, e) as ex -> let t = expr e in
	      (match op with
	       Neg when t = Int -> Int
	     | Not when t = Bool -> Bool
       | _ -> raise (Failure ("illegal unary operator " ^ string_of_uop op ^
	  		       string_of_typ t ^ " in " ^ string_of_expr ex)))

      | AccessStructField(e, field_name) -> let lt = expr e in
         check_AccessStructField lt field_name

      | Noexpr -> Void

      | Assign(e1, e2) as ex ->
        (match e1 with 
          Id s -> let lt = type_of_identifier s and rt = expr e2 in
            if rt <> AnyType then check_assign lt rt (Failure ("illegal assignment " ^ string_of_typ lt ^
                                     " = " ^ string_of_typ rt ^ " in " ^ string_of_expr ex))
            else  check_assign rt rt (Failure ("illegal assignment " ^ string_of_typ lt ^
                                     " = " ^ string_of_typ rt ^ " in " ^ 
                                     string_of_expr ex))
        | AccessStructField(_, _) -> expr e2
        | _ -> raise (Failure("illegal graph operator")))

      | GraphOp(s1, gop, s2) -> let t1 = type_of_identifier s1 and t2 = type_of_identifier s2 in 
        (match t1 with 
            GraphType(typ) -> 
            (match gop with 
              AddNode when t1 = GraphType typ && t2 = String -> GraphType typ
            | RemoveNode when t1 = GraphType typ && t2 = String -> GraphType typ
            | _ -> raise (Failure("illegal graph operator"))
            )
          | _ -> raise(Failure("operand is not a graph"))
        )

      | GraphOpAddEdge(e, _, gop2, s1, s2) -> let t1 = expr e and 
       t2 = type_of_identifier s1 and t3 = type_of_identifier s2 in 
       
        (match t1 with 
            GraphType(typ) -> 
            (match gop2 with 
              AddEdge when t2 = NodeType typ && t3 = NodeType typ -> GraphType typ
              | _ -> raise(Failure("illegal graph operator"))
            )
          | _ -> raise(Failure("operand is not a graph"))
        )
        
       | GraphOpRemoveEdge(e, gop3, s1, s2) -> let t1 = type_of_identifier e and 
       t2 = type_of_identifier s1 and t3 = type_of_identifier s2 in 
        (match t1 with 
            GraphType(typ) -> 
            (match gop3 with 
              RemoveEdge when t2 = NodeType typ && t3 = NodeType typ -> GraphType typ
              | _ -> raise(Failure("illegal graph operator"))
            )
          | _ -> raise(Failure("operand is not a graph"))
        )
        

      | NodeOp(e, nop, s) -> let t1 = expr e and t2 = type_of_identifier s in 

        (match nop with 
          AccessNode -> 
          (match t1 with 
           GraphType typ when t1 = GraphType(typ) && t2 = String -> NodeType(typ)
           | _ -> raise (Failure("not a graph"))
          )
        )

      | NodeOp2(e, nop2) -> let t1 = expr e in
        (match t1 with 
          NodeType typ -> 
          (match nop2 with 
             GetName -> String
           | GetData -> typ 
           | GetVisited -> Bool
           | GetinNodes -> ListType(String) 
           | GetoutNodes -> ListType(String) 
          )
          | _ -> raise(Failure("Not a vaild node operator"))
        )


      | Call(fname, actuals) as call -> let fd = function_decl fname in
         if List.length actuals != List.length fd.formals then
           raise (Failure ("expecting " ^ string_of_int
             (List.length fd.formals) ^ " arguments in " ^ string_of_expr call))
         else
           List.iter2 (fun (ft, _) e -> let et = expr e in
              ignore (check_assign ft et
                (Failure ("illegal actual argument found " ^ string_of_typ et ^
                " expected " ^ string_of_typ ft ^ " in " ^ string_of_expr e))))
             fd.formals actuals;
           fd.typ

      | ObjectCall(oname, fname, actuals) as objectcall -> let fd = function_decl fname in
        let returntype = ref (fd.typ) in 
        if List.length actuals != List.length fd.formals then
          raise (Failure ("expecting " ^ string_of_int
             (List.length fd.formals) ^ " arguments in " ^ string_of_expr objectcall))

        else
           List.iter2 (fun (ft, _) e -> let et = expr e in
           
            (* if fname = "qfront" then let _ = print_endline (string_of_typ actqtype) in returntype := actqtype *)
              if fname = "qadd" then
                 let acttype = expr oname in 
                 let actqtype = getQueueType acttype in 
                ignore(check_assign actqtype et (Failure ("illegal actual queue argument found " ^ string_of_typ et ^
                " expected " ^ string_of_typ actqtype ^ " in " ^ string_of_expr e))) 

              else if fname = "weight" then 
                 let acttype = expr (List.hd actuals) in 
                  ignore(check_assign acttype et (Failure ("illegal actual node argument found " ^ string_of_typ et ^
                " expected " ^ string_of_typ acttype ^ " in " ^ string_of_expr e)))
              
              else if fname = "p_push" then 
                 let acttype = expr (List.hd actuals) in 
                  ignore(check_assign acttype et (Failure ("illegal actual pqueue argument found " ^ string_of_typ et ^
                " expected " ^ string_of_typ acttype ^ " in " ^ string_of_expr e)))
              
              else if fname = "setData" then 
                 let acttype = expr oname in 
                 let actntype = getNodeType acttype in 
                  ignore(check_assign actntype et (Failure ("illegal actual node argument found " ^ string_of_typ et ^
                " expected " ^ string_of_typ actntype ^ " in " ^ string_of_expr e)))
              else if fname = "l_add" then
                let acttype = expr oname in 
                let actltype = getListType acttype in
                ignore(check_assign actltype et (Failure ("illegal actual list argument found " ^ string_of_typ et ^
                " expected " ^ string_of_typ actltype ^ " in " ^ string_of_expr e)))
              else ignore (check_assign ft et (Failure ("illegal actual argument found " ^ string_of_typ et ^
                " expected " ^ string_of_typ ft ^ " in " ^ string_of_expr e)))) fd.formals actuals;
           !returntype

     

    in

    let check_bool_expr e = if expr e != Bool
                            then raise (Failure ("expected Boolean expression in " ^ string_of_expr e))
                            else () in

    (* Verify a statement or throw an exception *)
    let rec stmt = function
	      Block sl -> let rec check_block = function
           [Return _ as s]  -> stmt s
         | Return _ :: _    -> raise (Failure "nothing may follow a return")
         | Block sl :: ss   -> check_block (sl @ ss)
         | s :: ss          -> stmt s ; check_block ss
         | [] -> ()
        in check_block sl
      | Expr e -> ignore (expr e)
      | Return e -> let t = expr e in if t = func.typ then () else
         raise (Failure ("return gives " ^ string_of_typ t ^ " expected " ^
                         string_of_typ func.typ ^ " in " ^ string_of_expr e))   
      | If(p, b1, b2) -> check_bool_expr p; stmt b1; stmt b2
      | For(e1, e2, e3, st) -> ignore (expr e1); check_bool_expr e2;
                               ignore (expr e3); stmt st
      | While(p, s) -> check_bool_expr p; stmt s
    in

    stmt (Block func.body)
   
  in
  List.iter check_function functions
