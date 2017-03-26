(* Ocamllex scanner for yeezyGraph *)

{ open Parser }

let letter = ['a'-'z' 'A'-'Z']
let digit = ['0'-'9']

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| "/*"     { comment lexbuf }           (* Comments *)
| '(' { LPAREN }       | ')' { RPAREN }
| '[' { LBRACKET }     | ']' { RBRACKET }      
| '{' { LBRACE }       | '}' { RBRACE }       
| ';' { SEMI }         | ',' { COMMA } 

| '+'  { PLUS }        | '-' { MINUS }             
| '*' { TIMES }        | '/' { DIVIDE }       
| '=' { ASSIGN }       | '%'  { MOD }         

| "=="  { EQ }         | "!=" { NEQ }         
| '<'  { LT }          | "<="   { LEQ } 
| ">" { GT }           | ">="     { GEQ }          
| "&&"   { AND }       | "||"    { OR }       
| "!"   { NOT }        

| "if"    { IF }       | "else" { ELSE }      
| "for"  { FOR }       | "while" { WHILE } 
| "return" { RETURN }  | "main" { MAIN }   

| "int"    { INT }     | "float" { FLOAT }     | "string" { STRING }  | "bool"   { BOOL }         

| "void" { VOID }      | "null" { NULL }  
| "true" { TRUE }      | "false"  { FALSE }  
| "INT_MAX" { INT_MAX} | "INT_MIN" { INT_MIN } | "FLOAT_MAX" { FLOAT_MAX } | "FLOAT_MIN" { FLOAT_MIN }      

| "list" { LIST }      | "map" { MAP }         | "queue" { QUEUE }    | "pqueue" { PQUEUE }  
| "struct" { STRUCT }  | "node" { NODE }       | "graph" { GRAPH } 

        
| '_' { UNDERSCORE }   | '@' { AT } 
| ':' { COLON }        | '.' { DOT }   
| '~' { TILDE }

| "++" { ADD_NODE }    | "--"  { REMOVE_NODE }            
| "->" {ADD_EDGE }     | "!->" { REMOVE_EDGE }

| digit+ as lxm { INT_LITERAL(int_of_string lxm) } (* how do we express negative ints/floats? *)
| digit+('.')digit+ as lxm {FLOAT_LITERAL(float_of_string lxm)}
| '"'([^'"']* as lxm)'"' {STR_LITERAL(lxm)}
| letter(letter|digit|'_')* as lxm { ID(lxm) }
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  "*/" { token lexbuf }
| _    { comment lexbuf }
