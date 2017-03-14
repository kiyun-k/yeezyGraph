(* Abstract Syntax Tree and functions for printing it *)

type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq |
          And | Or 

type nop = AccessNode (*underscore, e.g. g1_n1*) | AccessNodeField (* At, g1_n1@visited*)
(* Do we need separate type operators for node,graph,struct? *)

type gop = AddNode | RemoveNode | AddEdge | RemoveEdge 

type sop = AccessStructField (* Dot *)

type uop = Neg | Not

type typ = Int | Bool | Void | String | Float | Node | Graph | List | Queue | PQueue | Map | Struct | Null
(*should void and null be included as types?*)

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
  (* is this even correct?? ): *)
  | GraphLit of NodeLit list 
  (*check with TA : is GraphLit right? *)
  (*NodeLit list or expr list?*)
  | Binop of expr * op * expr
  (* how about for strings? are they a separate set of ops or not? 
  since not all operators have meaning with strings or may be overloaded [such as +]*)
  | Unop of uop * expr
  | StructOp of expr * sop * expr
  (* Do we differentiate our struct/node/graph operation expressions? *)
  (* since sop = dot is just punctuation, should it just be StructOp of expr * expr?
     in such a case, should we merge sop with other ops? these questions also apply to NodeOp and GraphOp *)
  | NodeOp of expr * nop * expr
  (* when we say g1_n1, it's a node literal
     g1_n1 is an expression of type expr * expr, but when we say g1_n1@name should it 
     be of type expr * expr, or expr * expr * string? Is this even the right way to think about this? *)
  | GraphOp of expr * gop * expr
  (* same question as with StructOp and NodeOp
      for adding an edge, expr * expr * (float | int), not just expr * expr. *)
  | Assign of string * expr
  | Call of string * expr list
  | ObjectCall of expr * string * expr list
  (* is this necessary / correct?? for stuff like list.get() *)
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