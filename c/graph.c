#include "map.h"
#include "graph.h"
#include "linkedlist.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
//g_init, addNode added

extern struct graph *g_init() { 
	struct graph *new_graph = malloc(sizeof(struct graph));
	struct List *new_list = l_init();
	new_graph->nodes = new_list;
	new_graph->size = 0;
	return new_graph;
}

extern void addNode (struct graph* g, struct node *n) {
	for (int i = 0; i < g->size; i++) {
		struct node *no = (struct node *)((l2_get(g->nodes, i))->data);
		if (no->name == n->name) {
			return;
		}
	}
	l_add(g->nodes, n);
	g->size++;
}

extern void removeNode (struct graph* g, struct node *n) {
	for (int i = 0; i < g->size; i++) {
		struct node *no = (struct node *)((l2_get(g->nodes, i))->data);
		if (strcmp(no->name, n->name) == 0) {
			struct ListNode *listnode = l2_get(g->nodes, i);
			l_delete(g->nodes, i);
			g->size--;
		}
	}

	for (int i = 0; i < g->size; i++) {
		struct node *no = (struct node *)((l2_get(g->nodes, i))->data);
		if (m_get(no->inNodes, n->name) != -1) {		
			m_remove(no->inNodes, n->name);
		}
		if (m_get(no->outNodes, n->name) != -1) {
			m_remove(no->outNodes, n->name);
		}
	}
}

extern void addEdge(struct graph* g, struct node *n1, struct node *n2, int weight) {
	// check that n1 and n2 exist 
	bool n1exist = false;
	int n1index = -1;
	bool n2exist = false;
	int n2index = -1;
	for (int i = 0; i < g->size; i++) {
		struct node *no = (struct node *)(l2_get(g->nodes, i))->data;
		if (no->name == n1->name) {
			n1exist = true;
			n1index = i;
		}
		if (no->name == n2->name) {
			n2exist = true;
			n2index = i;
		}
	}
	if (n1exist && n2exist != true) {
		return;
	}

	struct node *no1 = (struct node *)(l2_get(g->nodes, n1index))->data;
	struct node *no2 = (struct node *)(l2_get(g->nodes, n2index))->data;


	// add to outNodes of n1
	m_insert(no1->outNodes, n2->name, weight);

	// add to inNodes of n1
	m_insert(no2->inNodes, n1->name, weight);

}

extern void removeEdge(struct graph* g, struct node *n1, struct node *n2) {
	// check that n1 and n2 exist 
	bool n1exist = false;
	int n1index = -1;
	bool n2exist = false;
	int n2index = -1;
	for (int i = 0; i < g->size; i++) {
		struct node *no = (struct node *)(l2_get(g->nodes, i))->data;
		if (no->name == n1->name) {
			n1exist = true;
			n1index = i;
		}
		if (no->name == n2->name) {
			n2exist = true;
			n2index = i;
		}
	}
	if (n1exist && n2exist != true) {
		return;
	}

	struct node *no1 = (struct node *)(l2_get(g->nodes, n1index))->data;
	struct node *no2 = (struct node *)(l2_get(g->nodes, n2index))->data;


	//check outNodes of n1
	int weight1 = m_get(no1->outNodes, no2->name);
	int weight2 = m_get(no1->outNodes, no2->name);
	if(weight1 != -1 && weight1 == weight2) {
		m_remove(no1->outNodes, no2->name);
		m_remove(no2->inNodes, no1->name);
	}
}


extern int getWeight(struct graph* g, char *n1, char *n2) {
	struct node *node1 = getNode(g, n1);
	struct node *node2 = getNode(g, n2);
	struct map *m = node1->outNodes;
	int result = m_get(m, n2);
	if (result != INFINITY) {
		return result;
	}
	else return INFINITY;

}


extern struct node *indexNode(struct graph* g, int index) {
	struct ListNode *listnode = l2_get(g->nodes, index);
	return listnode->data;
}

void removeAllNodes(struct graph* g) {
	for (int i = 0; i < g->size; i++) {
		struct ListNode *listnode = l2_get(g->nodes, i);
		struct node *no = listnode->data;
		removeNode(g, no);
	}
}


void freeGraph(struct graph* g) {
	for (int i = 0; i < g->size; i++) {
		struct ListNode *listnode = l2_get(g->nodes, i);
		free(listnode->data);
		free(listnode);
	}
	free(g->nodes);
	free(g);
}

void printGraph(struct graph* g) {
	printf("%s\n", "graph: ");
	for (int i = 0; i < g->size; i++) {
		struct ListNode *listnode = l2_get(g->nodes, i);
		struct node *nod = (struct node *)listnode->data;
		print_node(nod);
		printf("%s", "\n");
	}

}


bool isEmpty(struct graph* g) {
	if (g->size == 0) {
		return true;
	}
	else return false;
}

int size(struct graph* g) {
	return g->size;
}

bool contains(struct graph* g, char *name) {
	for (int i = 0; i < g->size; i++) {
		struct node *no = (struct node *)(l2_get(g->nodes, i))->data;
		if (no->name == name ){
			return true;
		}
	}
	return false;

}

struct node *getNode(struct graph* g, char *name) {
	for (int i = 0; i < g->size; i++) {
		struct node *no = (struct node *)(l2_get(g->nodes, i))->data;
		if (no->name == name ){
			return no;
		}
	}
	return NULL;

}

