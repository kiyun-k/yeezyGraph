(* Ocamllex scanner for yeezyGraph *)

{ open Parser }

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| "/*"     { comment lexbuf }           (* Comments *)
| '('      { LPAREN }   | ')'      { RPAREN } | '{'      { LBRACE } | '}'      { RBRACE }
| ';'      { SEMI } | ','      { COMMA } | '+'      { PLUS } | '-'      { MINUS }
| '*'      { TIMES } | '/'      { DIVIDE } | '='      { ASSIGN }| "=="     { EQ }
| "!="     { NEQ } | '<'      { LT } | "<="     { LEQ } | ">"      { GT } | ">="     { GEQ }
| "&&"     { AND } | "||"     { OR } | "!"      { NOT } | "if"     { IF } | "else"   { ELSE }
| "for"    { FOR } | "while"  { WHILE } | "return" { RETURN } | "int"    { INT } | "float"  { FLOAT }
| "string" { STRING } | "bool"   { BOOL } | "void"   { VOID } | "true"   { TRUE } | "false"  { FALSE }
| "struct" { STRUCT } | "list" { LIST } | "map" { MAP } | "queue" { QUEUE } | "pqueue" { PQUEUE }
| "node" { NODE } | "graph" { GRAPH } | "null" { NULL } | "fun" { FUN } | "main" { MAIN } | '_' { UNDERSCORE }
| '@' { AT } | "INT_MAX" { INT_MAX} | "INT_MIN" { INT_MIN } | "FLOAT_MAX" { FLOAT_MAX } | "FLOAT_MIN" { FLOAT_MIN } 
| ['0'-'9']+ as lxm { LITERAL(int_of_string lxm) }
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* as lxm { ID(lxm) }
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  "*/" { token lexbuf }
| _    { comment lexbuf }
