(* Abstract Syntax Tree *)

type op = Add | Sub | Mult | Div | 
          Equal | Neq | Less | Leq | Greater | Geq |
          And | Or 
          (* | AccessStructField *)

(*
type nop = AccessNode (*underscore, e.g. g1_n1*) | AccessNodeField (* At, g1_n1@visited*)

type gop = AddNode | RemoveNode | AddEdge | RemoveEdge 
*)

type uop = Neg | Not

type typ = Int | Bool | Void|  String
          (* | Float | 
           Node | Graph | 
           ListOfInt | ListOfBool | ListOfString | ListOfFloat | 
           QueueOfInt | QueueOfBool | QueueOfString | QueueOfFloat |
           PQueueOfInt | PQueueOfBool | PQueueOfString | PQueueOfFloat | 
           MapOfStringInt | MapOfStringString |
           Struct | *)
           
type bind = typ * string

type expr = 
    Literal of int 
  (* | FloatLit of float *)
  | BoolLit of bool 
  | StringLit of string 
  (*| ListLit of expr list *)
  | Id of string
  | Binop of expr * op * expr 
  | Unop of uop * expr
  (*
  | NodeOp of expr * nop * string (* g1_n1 / g1_n1@name *) 
  | GraphOp of string * gop * string (* g1++n1 *)
  | GraphOpAddEdgeInt of expr * int * gop * expr
  | GraphOpAddEdgeFloat of expr * float * gop *  expr
  *)
  | Assign of string * expr
  | Call of string * expr list
  (* | ObjectCall of string * string * expr list  *)
  | Noexpr


type stmt =
    Block of stmt list
  | Expr of expr
  | Return of expr
  | If of expr * stmt * stmt
  | For of expr * expr * expr * stmt (* for (int i = 0; i < 10; i++) { ... } *)
  (* | ForNode of bind * string * stmt  for (node x : g) { ... } (* Doublecheck with TA *) *)
  | While of expr * stmt


type func_decl = {
    typ : typ;
    fname : string;
    formals : bind list;
    locals : bind list;
    body : stmt list;
  }

(*
type struct_type_decl = { (*Check with TA *)
  sname : string;
  body : bind list; 
}
*)


type program = bind list * func_decl list (* * struct_type_decl list *)