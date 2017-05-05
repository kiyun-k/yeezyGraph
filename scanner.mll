(* Ocamllex scanner for MicroC *)

{ open Parser }

let digit = ['0'-'9']

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| "/*"     { comment lexbuf }           (* Comments *)

| '('      { LPAREN }		| ')'      { RPAREN }
| '['      { LBRACKET }		| ']'      { RBRACKET }
| '{'      { LBRACE }		| '}'      { RBRACE }
| ';'      { SEMI }			| ','      { COMMA }

| '+'      { PLUS }			| '-'      { MINUS }
| '*'      { TIMES }		| '/'      { DIVIDE }
| '='      { ASSIGN }

| "=="     { EQ }			| "!="     { NEQ }
| '<'      { LT }			| "<="     { LEQ }
| ">"      { GT }			| ">="     { GEQ }
| "&&"     { AND }			| "||"     { OR }
| "!"      { NOT }

| "if"     { IF }			| "else"   { ELSE }
| "for"    { FOR }			| "while"  { WHILE }
| "return" { RETURN }		| "new"    { NEW }
| '.' 	   { DOT }  

| "int"    { INT }			
| "bool"   { BOOL }			| "true"   { TRUE }			| "false"  { FALSE }
| "float"  { FLOAT } 
| "string" { STRING }

| "struct" { STRUCT }		| "~"	   { TILDE }
| "Queue"  { QUEUE }		
| "graph" { GRAPH }   		| "node"   { NODE }

| "~+" { ADD_NODE }			| "~-" { REMOVE_NODE }
| "->" { ADD_EDGE }			| "!->" { REMOVE_EDGE }

| "~_" { UNDERSCORE }   
| "@name" { GET_NAME }      | "@visited" { GET_VISITED } 
| "@data" { GET_DATA }


| "new" { NEW }
| "void"   { VOID }


| ['0'-'9']+ as lxm { INT_LITERAL(int_of_string lxm) }
| digit+('.')digit+ as lxm { FLOAT_LITERAL(float_of_string lxm) }
| '"'([^'"']* as lxm)'"' { STR_LITERAL(lxm) }
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* as lxm { ID(lxm) }
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  "*/" { token lexbuf }
| _    { comment lexbuf }
