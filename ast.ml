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
  (* Does expr has to be more specific, such as BoolLit, etc. 
  Answer: You need to include all forms of expressions, but maybe you can make a literal thing and 
  then just type that as an expression. Eg:
  type lit = ...
  and then
  type expr = lit | Binop...
  *)
  (* is this even correct?? ): *)
  | GraphLit of NodeLit list 
  (*check with TA : is GraphLit right? 
  Answer: is is a literal? What does it look like? i don't know if it is right-- it is completely dependent on your langauge.
  *)
  (*NodeLit list or expr list?*)
  | Binop of expr * op * expr
  (* how about for strings? are they a separate set of ops or not? 
  since not all operators have meaning with strings or may be overloaded [such as +]
  Answer: this is language dependent. Up to you.
  *)
  | Unop of uop * expr
  | StructOp of expr * sop * expr
  (* Do we differentiate our struct/node/graph operation expressions? 
  Answer: this is language dependent. Up to you. Probably better to organize the AST better though,
  this is really messy.
  *)
  (* since sop = dot is just punctuation, should it just be StructOp of expr * expr?
     in such a case, should we merge sop with other ops? these questions also apply to NodeOp and GraphOp 
  Answer: whitespace dependent. same as nop's above
   *)
  | NodeOp of expr * nop * expr
  (* when we say g1_n1, it's a node literal
     g1_n1 is an expression of type expr * expr, but when we say g1_n1@name should it 
     be of type expr * expr, or expr * expr * string? Is this even the right way to think about this? 
  Ansewr: whitespace dependent
   *)
  | GraphOp of expr * gop * expr
  (* same question as with StructOp and NodeOp
      for adding an edge, expr * expr * (float | int), not just expr * expr. *)
  | Assign of string * expr
  | Call of string * expr list
  | ObjectCall of expr * string * expr list
  (* is this necessary / correct?? for stuff like list.get() 
  Answer: if it is in your language, it is correct. but make sure you aren't getting confused with what goes
  in the AST and what goes in the parser
  *)
  | Noexpr

  (*where do variable declarations go?????? and also other declarations?????? 
  are these declarations statements or expressions?
  for example: list<int> l;
  what if i want to say list<int> l = [1,2,3]; ? is that a statement or expression? 
  is it expressable in our language right now? *)

type stmt =
    Block of stmt list


  | Expr of expr
  | Return of expr
  | If of expr * stmt * stmt
  | For of expr * expr * expr * stmt
  | For of expr * expr * stmt (* check with TA the correctness of expr whether you use stmt/stmt list*)
  (* Another possible for expression (iteration): for of string * expr * stmt (is this correct?)*)
  (* should we also replace expr with Nodelit or graphlit? 
  Answer: language dependent, up to you.
  *)
  | While of expr * stmt
  (*should we add statements for declaring collections, structs, nodes, or graphs? *)
  (*for example, should we use something like NodeDef, GraphDef, etc.
  create a new type- declarations!
  *)
  

type func_decl = {
    typ : typ;
    fname : string;
    formals : bind list;
    locals : bind list;
    body : stmt list;
  }

type program = bind list * func_decl list