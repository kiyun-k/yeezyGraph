(* Abstract Syntax Tree and functions for printing it *)

type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq |
          And | Or 

type nop = AccessNode (*underscore, e.g. g1_n1*) | AccessNodeField (* At, g1_n1@visited*)
(* Do we need separate type operators for node,graph,struct? *)

type gop = AddNode | RemoveNode | AddEdge | RemoveEdge 

type sop = AccessStructField (* Dot *)

type uop = Neg | Not

type typ = Int | Bool | Void | String | Float | Node | Graph | List | Queue | PQueue | Map | Struct | Null

type bind = typ * string

(* Do we need to add in expressions for accessing Collections elements? *)
(* Do we need to add in an expression representing the (string, int) pair value for the Map collection? *)
type expr =
  IntLit of int

  | FloatLit of float 
  | StringLit of string
  | BoolLit of bool
  | Id of string
  | ListLit of expr list 
  | QueueLit of expr list
  | PQueueLit of expr list
  | MapLit of (expr * expr) list
  | StructLit of expr list 
  | NodeLit of string * expr * expr * expr * expr
  (* Does expr has to be more specific, such as BoolLit, etc. *)
  | GraphLit of NodeLit list 
  (*check with TA : is GraphLit right? *)
  | Binop of expr * op * expr
  | Unop of uop * expr
  | StructOp of expr * sop * expr
  (* Do we differentiate our struct/node/graph operation expressions? *)
  | NodeOp of expr * nop * expr
  | GraphOp of expr * gop * expr
  | Assign of string * expr
  | Call of string * expr list
  | Noexpr

type stmt =
    Block of stmt list


  | Expr of expr
  | Return of expr
  | If of expr * stmt * stmt
  | For of expr * expr * expr * stmt
  | For of expr * expr * stmt (* check with TA the correctness of expr whether you use stmt/stmt list*)
  (* Another possible for expression (iteration): for of string * expr * stmt (is this correct?)*)
  (* should we also replace expr with Nodelit or graphlit? *)
  | While of expr * stmt
  (*should we add statements for declaring collections, structs, nodes, or graphs? *)
  (*for example, should we use something like NodeDef, GraphDef, etc.*)
  

type func_decl = {
    typ : typ;
    fname : string;
    formals : bind list;
    locals : bind list;
    body : stmt list;
  }

type program = bind list * func_decl list