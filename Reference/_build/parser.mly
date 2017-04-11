/* Ocamlyacc parser for YeezyGraph */

/* Accessing the elements of a 3-tuple */
%{
  let get_1_3 (a,_,_) = a
  let get_2_3 (_,a,_) = a
  let get_3_3 (_,_,a) = a
%}

/* Punctuation tokens*/
%token SEMI LPAREN RPAREN LBRACKET RBRACKET LBRACE RBRACE COMMA COLON
/* Arithmetic tokens */
%token PLUS MINUS TIMES DIVIDE MOD ASSIGN NOT
/* Logical tokens */
%token EQ NEQ LT LEQ GT GEQ TRUE FALSE AND OR
/* Primitive datatype tokens */
%token INT FLOAT STRING BOOL 
/* Control flow tokens */
%token IF ELSE FOR WHILE
/* Function tokens */
%token RETURN VOID MAIN
%token NODE GRAPH 
/* Node token s*/
%token UNDERSCORE AT 
%token NULL

/* Graph tokens */
%token ADD_NODE REMOVE_NODE ADD_EDGE REMOVE_EDGE
/* Collection tokens */
%token LIST QUEUE PQUEUE MAP STRUCT
/* STRUCT tokens */
%token TILDE
/* BUILT-IN FUNCTION tokens */
%token DOT
/* Infinity tokens */  
%token INT_MAX INT_MIN FLOAT_MAX FLOAT_MIN
/* Number literals */
%token <int> INT_LITERAL
%token <float> FLOAT_LITERAL
/* String literal */
%token <string> STR_LITERAL
/* Variable names */
%token <string> ID
%token EOF


%nonassoc NOELSE
%nonassoc ELSE
%right ASSIGN
%left OR
%left AND
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE MOD
%right NOT NEG
%left DOT
%left TILDE
%nonassoc AT LBRACKET RBRACKET
%left ADD_EDGE REMOVE_EDGE
%nonassoc UNDERSCORE
%left ADD_NODE REMOVE_NODE




%start program 
%type <Ast.program> program 

%%

program:
  decls EOF { $1 }

decls:
   /* nothing */ { [], [], [] }
 | decls vdecl { ($2 :: fst $1), snd $1, get_3_3($1) }
 | decls fdecl { fst $1, ($2 :: snd $1), get_3_3($1) }
 | decls sdecl { fst $1, snd $1, $2 :: get_3_3($1) } 



fdecl:
   typ ID LPAREN formals_opt RPAREN LBRACE vdecl_list stmt_list RBRACE
     { { typ = $1;
         fname = $2;
         formals = $4;
         locals = List.rev $7;
         body = List.rev $8 } }

formals_opt:
    /* nothing */ { [] }
  | formal_list   { List.rev $1 }

formal_list:
    typ ID                   { [($1,$2)] }
  | formal_list COMMA typ ID { ($3,$4) :: $1 } 



typ:
    INT { Int }
  | FLOAT { Float }
  | STRING { String }
  | BOOL { Bool }
  | VOID { Void }
  | LIST LT INT GT { ListOfInt}
  | LIST LT FLOAT GT { ListOfFloat}
  | LIST LT BOOL GT { ListOfBool}
  | LIST LT STRING GT { ListOfString}
  | MAP LT STRING COMMA INT GT  { MapOfStringInt }
  | MAP LT STRING COMMA STRING GT  { MapOfStringString }
  | QUEUE LT INT GT { QueueOfInt}
  | QUEUE LT FLOAT GT { QueueOfFloat}
  | QUEUE LT BOOL GT { QueueOfBool}
  | QUEUE LT STRING GT { QueueOfString}
  | PQUEUE LT INT GT { PQueueOfInt}
  | PQUEUE LT FLOAT GT { PQueueOfFloat}
  | PQUEUE LT BOOL GT { PQueueOfBool}
  | PQUEUE LT STRING GT { PQueueOfString}
  | STRUCT ID { $2 }    /*Check again*/
  | GRAPH { Graph }
  | NODE { Node }


  
vdecl_list:
    /* nothing */    { [] }
  | vdecl_list vdecl { $2 :: $1 }

vdecl:
   typ ID SEMI { ($1, $2) }



sdecl: 
   STRUCT ID ASSIGN LBRACE formals_opt RBRACE
      { {
        sname = $2
        body = $5 } } 



stmt_list:
    /* nothing */  { [] }
  | stmt_list stmt { $2 :: $1 }

stmt:
    expr SEMI { Expr $1 }
  | RETURN SEMI { Return Noexpr }
  | RETURN expr SEMI { Return $2 }
  | LBRACE stmt_list RBRACE { Block(List.rev $2) }
  | IF LPAREN expr RPAREN stmt %prec NOELSE { If($3, $5, Block([])) }
  | IF LPAREN expr RPAREN stmt ELSE stmt    { If($3, $5, $7) }
  | FOR LPAREN expr_opt SEMI expr SEMI expr_opt RPAREN stmt
     { For($3, $5, $7, $9) }
  | FOR LPAREN expr COLON expr RPAREN stmt {ForNode($3, $5, $7)} /*check with TA*/
  | WHILE LPAREN expr RPAREN stmt { While($3, $5) }



expr:
    INT_LITERAL                   { Literal($1) } 
  | FLOAT_LITERAL                 { FloatLit($1) } 
  | STR_LITERAL                   { StringLit($1) } 
  | TRUE                          { BoolLit(true) }
  | FALSE                         { BoolLit(false) }
  | ID                            { Id($1) }
  | LBRACKET actuals_opt RBRACKET {ListLit($2)}  
  | expr PLUS   expr              { Binop($1, Add,   $3) }
  | expr MINUS  expr              { Binop($1, Sub,   $3) }
  | expr TIMES  expr              { Binop($1, Mult,  $3) }
  | expr DIVIDE expr              { Binop($1, Div,   $3) }
  | expr EQ     expr              { Binop($1, Equal, $3) }
  | expr NEQ    expr              { Binop($1, Neq,   $3) }
  | expr LT     expr              { Binop($1, Less,  $3) }
  | expr LEQ    expr              { Binop($1, Leq,   $3) }
  | expr GT     expr              { Binop($1, Greater, $3) }
  | expr GEQ    expr              { Binop($1, Geq,   $3) }
  | expr AND    expr              { Binop($1, And,   $3) }
  | expr OR     expr              { Binop($1, Or,    $3) }
  | expr TILDE    expr            { Binop($1, AccessStructField, $3) }
  | expr UNDERSCORE ID            { NodeOp($1, AccessNode, $3) } 
  | expr AT ID                    { NodeOp($1, AccessNodeField, $3) } 
  | ID ADD_NODE ID                { GraphOp($1, AddNode, $3) }
  | ID REMOVE_NODE ID             { GraphOp($1, RemoveNode, $3) }
  | expr LBRACKET INT_LITERAL RBRACKET ADD_EDGE expr    { GraphOpAddEdgeInt($1, $3, AddEdge, $6) } 
  | expr LBRACKET FLOAT_LITERAL RBRACKET ADD_EDGE expr  { GraphOpAddEdgeFloat($1, $3, AddEdge, $6) }
  | ID REMOVE_EDGE ID             { GraphOp($1, RemoveEdge, $3) }
  | MINUS expr %prec NEG          { Unop(Neg, $2) }
  | NOT expr                      { Unop(Not, $2) }
  | ID ASSIGN expr                { Assign($1, $3) }
  | ID LPAREN actuals_opt RPAREN  { Call($1, $3) }
  | ID DOT ID LPAREN actuals_opt RPAREN { ObjectCall($1, $3, $5) }    
  | LPAREN expr RPAREN            { $2 }

expr_opt:
    /* nothing */ { Noexpr }
  | expr          { $1 }



/* Comma-separated lists of things */
actuals_opt:
    /* nothing */ { [] }
  | actuals_list  { List.rev $1 }

actuals_list:
    expr                    { [$1] }
  | actuals_list COMMA expr { $3 :: $1 }
