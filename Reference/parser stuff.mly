all intlit-> literal

typ

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


