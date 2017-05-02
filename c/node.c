#include "map.h"
#include "node.h"
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
//n_init added

struct node *n_init(char *name) {
	struct node *new_node = malloc(sizeof(struct node));
	new_node->name = name;
	new_node->visited = false;
	new_node->inNodes = m_init();
	new_node->outNodes = m_init();
	new_node->data = malloc(sizeof(void *));
	return new_node;
}

void set_data(struct node *curr_node, void *data) {
	curr_node->data = data;
}


char *get_name(struct node *curr_node) {
	return curr_node->name;

}

bool get_visited(struct node *curr_node) {
	return curr_node->visited;

}

void modify_visited(struct node *curr_node, bool val){
	curr_node->visited = val;
	return;
}

struct map *get_inNodes(struct node *curr_node) {
	return curr_node->inNodes;
}

struct map *get_outNodes(struct node *curr_node) {
	return curr_node->outNodes;
}

void *get_data(struct node *curr_node) {
	return curr_node->data;
}

void print_node(struct node *n) {
	printf("%s ", "node name: ");
	printf("%s\n", n->name);
	printf("%s ", "node visited: ");
	printf("%d\n", n->visited);
	printf("%s ", "node inNodes: ");
	print_map(n->inNodes);
	printf("%s ", "node outNodes: ");
	print_map(n->outNodes);

}
