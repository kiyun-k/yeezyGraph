(* Ocamllex scanner for MicroC *)

{ open Parser }

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| "/*"     { comment lexbuf }           (* Comments *)
| '('      { LPAREN }		| ')'      { RPAREN }
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

| "~"	   { TILDE }

| "if"     { IF }			| "else"   { ELSE }
| "for"    { FOR }			| "while"  { WHILE }
| "return" { RETURN }

| "int"    { INT }			| "bool"   { BOOL }			| "string"	{ STRING }
| "struct" { STRUCT }

| "void"   { VOID }

| "true"   { TRUE }			| "false"  { FALSE }

| ['0'-'9']+ as lxm { INT_LITERAL(int_of_string lxm) }
| '"'([^'"']* as lxm)'"' {STR_LITERAL(lxm)}
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* as lxm { ID(lxm) }
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  "*/" { token lexbuf }
| _    { comment lexbuf }