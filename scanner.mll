(* Ocamllex scanner for yeezyGraph *)

{ open Parser }

let letter = ['a'-'z' 'A'-'Z']
let digit = ['0'-'9']

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| "/*"     { comment lexbuf }           (* Comments *)
| '(' { LPAREN }       | ')' { RPAREN }            | '{' { LBRACE }      
| '}' { RBRACE }       | ';' { SEMI }              | ',' { COMMA }        
| '+'  { PLUS }        | '-' { MINUS }             | '*' { TIMES }     
| '/' { DIVIDE }       | '=' { ASSIGN }            | "=="  { EQ }              
| "!=" { NEQ }         | '<'  { LT }               | "<="   { LEQ } 
| ">" { GT }           | ">="     { GEQ }          | "&&"   { AND }      
| "||"    { OR }       | "!"   { NOT }             | "if"    { IF }       
| "else" { ELSE }      | "for"  { FOR }            | "while" { WHILE } 
| "return" { RETURN }  | "int"    { INT }          | "float" { FLOAT }         
| "string" { STRING }  | "bool"   { BOOL }         | "void" { VOID }     
| "true" { TRUE }      | "false"  { FALSE }        | "struct" { STRUCT } 
| "list" { LIST }      | "map" { MAP }             | "queue" { QUEUE }    
| "pqueue" { PQUEUE }  | "node" { NODE }           | "graph" { GRAPH } 
| "null" { NULL }      | "fun" { FUN }             | "main" { MAIN }           
| '_' { UNDERSCORE }   | '@' { AT }                | "INT_MAX" { INT_MAX} 
| "INT_MIN" { INT_MIN }| "FLOAT_MAX" { FLOAT_MAX } | "FLOAT_MIN" { FLOAT_MIN } 
| '%'  { MOD }         | "++" { ADD_NODE }         | "--"  { REMOVE_NODE }
| ':' { COLON }        | '.' { DOT }               | "\-\>" { ADD_EDGE }
| "!\-\>" { REMOVE_EDGE }
| digit+ as lxm { INT_LITERAL(int_of_string lxm) } (* how do we express negative ints/floats? *)
| digit+('.')digit+ as lxm {FLOAT_LITERAL(float_of_string lxm)}
| '"'([^'"']* as lxm)'"' {STR_LITERAL(lxm)}
| letter(letter|digit|'_')* as lxm { ID(lxm) }
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  "*/" { token lexbuf }
| _    { comment lexbuf }
