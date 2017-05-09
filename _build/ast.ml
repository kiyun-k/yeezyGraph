(* Abstract Syntax Tree and functions for printing it *)

type op = Add | Sub | Mult | Div | 
          Equal | Neq | Less | Leq | Greater | Geq |
          And | Or

type gop = AddNode | RemoveNode  
type gop2 = AddEdge 
type gop3 = RemoveEdge

type nop = AccessNode (*underscore, e.g. g1_n1*) 
type nop2 = GetName | GetData | GetVisited


type uop = Neg | Not

type typ = Int | Bool | Float | String | Void 
          | StructType of string | GraphType of typ | NodeType of typ 
          | QueueType of typ | PQueueType | AnyType 

type bind = typ * string

type expr =
    IntLit of int
  | BoolLit of bool
  | FloatLit of float
  | StringLit of string
  | Queue of typ * expr list 
  | PQueue of expr list
  | Id of string
  | Binop of expr * op * expr
  | Unop of uop * expr
  | AccessStructField of expr * string 
  | Assign of expr * expr
  | Call of string * expr list
  | ObjectCall of expr * string * expr list 
  | Noexpr
  | NodeOp of expr * nop * string (* g1_n1 / g1_n1@name *) 
  | NodeOp2 of expr * nop2 
  | GraphOp of string * gop * string
  | GraphOpRemoveEdge of string * gop3 * string * string 
  | GraphOpAddEdge of expr * int * gop2 * string * string
  | Graph of typ
  | Node of string * typ
  | Infinity
  | NegInfinity

type stmt =
    Block of stmt list
  | Expr of expr
  | Return of expr
  | If of expr * stmt * stmt
  | For of expr * expr * expr * stmt
  | While of expr * stmt

type func_decl = {
    typ : typ;
    fname : string;
    formals : bind list;
    locals : bind list;
    body : stmt list;
}

type struct_decl = { 
  sname : string;
  sformals : bind list; 
}

type program = bind list * func_decl list * struct_decl list


(* Pretty-printing functions *)

let string_of_op = function
    Add -> "+"
  | Sub -> "-"
  | Mult -> "*"
  | Div -> "/"
  | Equal -> "=="
  | Neq -> "!="
  | Less -> "<"
  | Leq -> "<="
  | Greater -> ">"
  | Geq -> ">="
  | And -> "&&"
  | Or -> "||"


let string_of_nop = function
  | AccessNode -> "~_"

let string_of_nop2 = function
    GetName -> "@name"
  | GetVisited -> "@visited"
  | GetData -> "@data"

let string_of_gop = function
    AddNode -> "~+"
  | RemoveNode -> "~-"
  


let string_of_gop2 = function
    AddEdge -> "->"

let string_of_gop3 = function
    RemoveEdge -> "!->"

let string_of_uop = function
    Neg -> "-"
  | Not -> "!"

let rec string_of_typ = function
    Int -> "int"
  | Float -> "float"
  | Bool -> "bool"
  | String -> "string"
  | Void -> "void"
  | GraphType(typ) -> "graph " ^ string_of_typ typ 
  | StructType(s) -> s
  | QueueType(typ) -> "queue " ^ string_of_typ typ
  | PQueueType -> "pqueue"
  | NodeType(typ) -> "node " ^ string_of_typ typ 
  | AnyType -> "AnyType"

let rec string_of_expr = function
    IntLit(l) -> string_of_int l
  | BoolLit(true) -> "true"
  | BoolLit(false) -> "false"
  | FloatLit(l) -> string_of_float l
  | StringLit(s) -> s
  | Id(s) -> s
  | Queue(typ, e1) -> "new " ^ "Queue" ^ "<" ^ string_of_typ typ ^ ">" ^ "(" ^ String.concat ", " (List.map string_of_expr e1) ^ ")"
  | PQueue(el) -> "new" ^ "pqueue" ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_expr e2
  | Unop(o, e) -> string_of_uop o ^ string_of_expr e
  | AccessStructField(v, e) -> string_of_expr v ^ "~" ^ e
  | Assign(v, e) -> string_of_expr v ^ " = " ^ string_of_expr e
  | Call(f, el) -> f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | ObjectCall(o, f, e1) -> string_of_expr o ^ "." ^ f ^ "(" ^ String.concat ", " (List.map string_of_expr e1) ^ ")"
  | Noexpr -> ""
  | NodeOp(e, o, s) -> string_of_expr e ^ string_of_nop o  ^ s 
  | NodeOp2(e, o) -> string_of_expr e ^ string_of_nop2 o  
  | Graph(typ) -> "new Graph" ^ "<" ^ string_of_typ typ ^ ">"
  | Node(n, typ) -> "new Node" ^ "<" ^ string_of_typ typ ^ ">" ^ "(" ^ n ^ ")"
  | GraphOp(s1, o, s2) ->  s1 ^ string_of_gop o ^  s2
  | GraphOpRemoveEdge(s1, o, s2, s3) ->   s1 ^ string_of_gop3 o ^  "(" ^ s2 ^ ", " ^ s3 ^ ")"
  | GraphOpAddEdge(s1, i, o, s2, s3) -> string_of_expr s1 ^ string_of_int i ^ string_of_gop2 o ^ "(" ^ s2 ^ ", " ^ s3 ^ ")"
  | Infinity -> "INFINITY"
  | NegInfinity -> "NEG-INFINITY"



let rec string_of_stmt = function
    Block(stmts) ->
      "{\n" ^ String.concat "" (List.map string_of_stmt stmts) ^ "}\n"
  | Expr(expr) -> string_of_expr expr ^ ";\n";
  | Return(expr) -> "return " ^ string_of_expr expr ^ ";\n";
  | If(e, s, Block([])) -> "if (" ^ string_of_expr e ^ ")\n" ^ string_of_stmt s
  | If(e, s1, s2) ->  "if (" ^ string_of_expr e ^ ")\n" ^
      string_of_stmt s1 ^ "else\n" ^ string_of_stmt s2
  | For(e1, e2, e3, s) ->
      "for (" ^ string_of_expr e1  ^ " ; " ^ string_of_expr e2 ^ " ; " ^
      string_of_expr e3  ^ ") " ^ string_of_stmt s
  | While(e, s) -> "while (" ^ string_of_expr e ^ ") " ^ string_of_stmt s

 
let string_of_vdecl (t, id) = string_of_typ t ^ " " ^ id ^ ";\n"

let string_of_fdecl fdecl =
  string_of_typ fdecl.typ ^ " " ^
  fdecl.fname ^ "(" ^ String.concat ", " (List.map snd fdecl.formals) ^
  ")\n{\n" ^
  String.concat "" (List.map string_of_vdecl fdecl.locals) ^
  String.concat "" (List.map string_of_stmt fdecl.body) ^
  "}\n"

let string_of_sdecl sdecl = 
  "struct " ^ sdecl.sname ^ " \n{\n" ^
  String.concat "; " (List.map snd sdecl.sformals) ^
  "}\n"

let string_of_program (vars, funcs, structs) =
  String.concat "" (List.map string_of_vdecl vars) ^ "\n" ^
  String.concat "\n" (List.map string_of_sdecl structs) ^ "\n" ^
  String.concat "\n" (List.map string_of_fdecl funcs) 