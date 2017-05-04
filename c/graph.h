#include "node.h"
#include "map.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "linkedlist.h"

#ifndef __GRAPH_H__
#define __GRAPH_H__


struct graph {
	struct List *nodes;
	int size;
};


extern struct graph *g_init();

extern void addNode (struct graph* g, struct node *n);

extern void removeNode (struct graph* g, struct node *n);

extern void addEdge(struct graph* g, struct node *n1, struct node *n2, int weight);

extern void removeEdge(struct graph* g, struct node *n1, struct node *n2);

extern struct node *indexNode(struct graph* g, int index); 

void freeGraph(struct graph* g);

void removeAllNodes(struct graph* g);

void printGraph(struct graph* g);

bool isEmpty(struct graph* g);

int size(struct graph* g);

bool contains(struct graph* g, char *name);

struct node *getNode(struct graph* g, char *name);



#endif



