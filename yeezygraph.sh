#!/bin/bash

clang -emit-llvm -o linkedlist.bc -c c/linkedlist.c
clang -emit-llvm -o node.bc -c c/node.c
clang -emit-llvm -o graph.bc -c c/graph.c
clang -emit-llvm -o queue.bc -c c/queue.c
clang -emit-llvm -o map.bc -c c/map.c

