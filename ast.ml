(* Abstract Syntax Tree and functions for printing it *)

type op = Add | Sub | Mult | Div | 
          Equal | Neq | Less | Leq | Greater | Geq |
          And | Or

type gop = AddNode | RemoveNode  | RemoveEdge | GetNode | AddEdge

type nop = AccessNode (*underscore, e.g. g1_n1*) | AccessNodeField (* At, g1_n1@visited*)


type uop = Neg | Not

type typ = Int | Bool | Float | String | Void | StructType of string | GraphTyp | Node

type bind = typ * string

type expr =
    IntLit of int
  | BoolLit of bool
  | FloatLit of float
  | StringLit of string
  | Id of string
  | Binop of expr * op * expr
  | Unop of uop * expr
  | AccessStructField of expr * string 
  | Assign of expr * expr
  | Call of string * expr list
  | Noexpr
  | NodeOp of expr * nop * string (* g1_n1 / g1_n1@name *) 
  | GraphOp of string * gop * string
  | GraphOpAddEdge of expr * int * gop * expr
  | Graph

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

let string_of_gop = function
    AddNode -> "~+"
  | RemoveNode -> "~-"
  | RemoveEdge -> "!->"
  | AddEdge -> "->"
  | GetNode -> "_"

let string_of_uop = function
    Neg -> "-"
  | Not -> "!"

let rec string_of_expr = function
    IntLit(l) -> string_of_int l
  | BoolLit(true) -> "true"
  | BoolLit(false) -> "false"
  | FloatLit(l) -> string_of_float l
  | StringLit(s) -> s
  | Id(s) -> s
  | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_expr e2
  | Unop(o, e) -> string_of_uop o ^ string_of_expr e
  | AccessStructField(v, e) -> string_of_expr v ^ "~" ^ e
  | Assign(v, e) -> string_of_expr v ^ " = " ^ string_of_expr e
  | Call(f, el) ->
      f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | Noexpr -> ""
  | Graph -> "new graph"
  | GraphOp(s1, o, s2) ->  s1 ^ string_of_gop o ^  s2
  | GraphOpAddEdge(s1, i, o, s2) -> string_of_expr s1 ^ string_of_int i ^ string_of_gop o ^ string_of_expr s2



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

let string_of_typ = function
    Int -> "int"
  | Float -> "float"
  | Bool -> "bool"
  | String -> "string"
  | Void -> "void"
  | StructType(s) -> s
  | GraphTyp -> "graph"
  | Node -> "node"

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