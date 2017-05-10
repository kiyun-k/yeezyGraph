#!/bin/bash

clang -emit-llvm -o linkedlist.bc -c c/linkedlist.c
clang -emit-llvm -o node.bc -c c/node.c
clang -emit-llvm -o graph.bc -c c/graph.c
clang -emit-llvm -o queue.bc -c c/queue.c
clang -emit-llvm -o map.bc -c c/map.c
clang -emit-llvm -o pqueue.bc -c c/pqueue.c

./yeezygraph.native <$1> a.ll
llvm-link linkedlist.bc node.bc graph.bc queue.bc map.bc pqueue.bc a.ll -S > run.ll
clang run.ll
./a.out
rm a.ll
rm run.ll
rm ./a.out
