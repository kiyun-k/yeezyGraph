(* Abstract Syntax Tree and functions for printing it *)

type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq |
          And | Or 

type nop = AccessNode (*underscore, e.g. g1_n1*) | AccessNodeField (* At, g1_n1@visited*)
(* Do we need separate type operators for node,graph,struct? 
Answer: Only if the whitespace matters for nop's and not for op's, or vice versa. If they
can be parsed in exactly the same way, then no.
*)


type gop = AddNode | RemoveNode | AddEdge | RemoveEdge 

type sop = AccessStructField (* Dot *)

type uop = Neg | Not

type typ = Int | Bool | Void | String | Float | Node | Graph | List | Queue | PQueue | Map | Struct | Null
(*should void and null be included as types?*)

type bind = typ * string

(* Do we need to add in expressions for accessing Collections elements? 
Answer: I'm not sure, it's up to you guys. Probably yes if it is built into your language, 
But you also could maybe reuse other operators, unless, again, they need to be parsed differently
*)
(* Do we need to add in an expression representing the (string, int) pair value for the Map collection?
Answer: No, you could use just expressions and then do the type checking in the analyzer:
Map of expr * expr
 *)

type intLit  = IntLit of int
type floatLit = FloatLit of float 
type boolLit = BoolLit of bool
type stringLit = StringLit of string
type listLit = ListLit of expr list (* Can we use expr that has been defined after this section of code?*)
type queueLit = QueueLit of expr list
type pqueueLit = PQueueLit of expr list
type mapLit = MapLit of (expr * expr) list

(* Do we need a graph literal? How would we express it? *)
type expr =
  
  | intLit
  | floatLit
  | boolLit  
  | stringLit 
  | listLit
  | queueLit (* is this supposed to be in blue lettering? Is this correct? *)
  | pqueueLit 
  | mapLit
  | structLit
  | Id of string
  (*| NodeLit of string * boolLit * mapLit * mapLit * structLit *)
  (* Is NodeLit not a valid expression, since we will never see a node being constructed this way? *)
  (*| GraphLit of NodeLit list *)
  | Binop of expr * op * expr
  | Unop of uop * expr
  | StructOp of structLit * sop * expr (*Should it be structLit or expr?*)
  | NodeOp of expr * nop * string (* should it be string or expr? *)
  | GraphOp of expr * gop * expr 
  | GraphOpAddEdge of expr * gop * (float | int) * expr (* Is this correct? *)
  | Assign of string * expr
  | Call of string * expr list
  | ObjectCall of expr * string * expr list
  | Noexpr


type stmt =
    Block of stmt list
    
  | Expr of expr
  | Return of expr
  | If of expr * stmt * stmt
  | For of expr * expr * expr * stmt
  | For of expr * expr * stmt (* check with TA the correctness of expr whether you use stmt/stmt list*)
  (* Another possible for expression (iteration): for of string * expr * stmt (is this correct?)*)
  | While of expr * stmt

  

type func_decl = {
    typ : typ;
    fname : string;
    formals : bind list;
    locals : bind list;
    body : stmt list;
  }

(*An example of how we intend to declare a struct*)
(*type structLit = StructLit of string * string * expr list *)
(* struct struct_name = { int a, int b, string c} *)
(* struct_name s; s.a = x; s.b = y; s.c = "abc" *)
type struct_decl = {
  typ : Struct; (* Is putting struct instead of typ correct here? *)
  sname : string;
  body : bind list; (* Is bind list correct here? *)
}

(* how do we express Type T in List<T> in our declarations?  *)
(* Should typ refer to the type List or the typ inside the container? *)
type list_decl = {
  typ : List; (* why isn't "List" blue here? *)
}
type map_decl
type queue_decl
type pqueue_decl


type graph_decl = {
  typ : Graph;
  gname : string;
}


type program = bind list * func_decl list * struct_decl list * list_decl list * map_decl list * queue_decl list * pqueue_decl list * graph_decl list