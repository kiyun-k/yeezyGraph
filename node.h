#include "map.h"
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>


struct node {
	char *name;
	bool visited;
	struct map *inNodes;
	struct map *outNodes;
	void *data;
};


struct node *n_init(char *name);

char *get_name(struct node *curr_node);

void set_data(struct node *curr_node, void *data);


bool get_visited(struct node *curr_node);

void modify_visited(struct node *curr_node, bool val);

struct map *get_inNodes(struct node *curr_node);

struct map *get_outNodes(struct node *curr_node);

void *get_data(struct node *curr_node);

void print_node(struct node *node);