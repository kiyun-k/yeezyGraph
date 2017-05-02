#include "map.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>



struct map *m_init() {
	int INITIAL_SIZE = 3;
	struct map *new_map = malloc(sizeof(struct map));
	new_map->nodes = malloc(sizeof(char *) * INITIAL_SIZE);
	for (int i = 0; i < INITIAL_SIZE; i++) {
		new_map->nodes[i] = NULL;
	}
	new_map->weight = malloc(sizeof(int) * INITIAL_SIZE);
	for (int i = 0; i < INITIAL_SIZE; i++) {
		new_map->weight[i] = 0;
	}
	new_map->table_size = INITIAL_SIZE;
	new_map->size = 0;
	return new_map;
}

void m_insert(struct map *curr_map, char *node, int val) {
	if(m_get(curr_map, node) != -1) {
		return;
	}
	if (curr_map->size == curr_map->table_size) {
		curr_map->table_size = curr_map->table_size * 2;
		curr_map->nodes = realloc(curr_map->nodes, sizeof(char *) * curr_map->table_size);
		curr_map->weight = realloc(curr_map->weight, sizeof(int) * curr_map->table_size);
	}
	//curr_map->nodes[curr_map->size] = malloc(sizeof(char *));
	//curr_map->weight[curr_map->size] = malloc(sizeof(int));

	curr_map->nodes[curr_map->size] = node;
	curr_map->weight[curr_map->size] = val;
	curr_map->size += 1;

}

int m_get(struct map *curr_map, char *node) {
	for (int i = 0; i < curr_map->size; i++) {
		if (strcmp(curr_map->nodes[i], node) == 0) {
			return curr_map->weight[i];
		}
	}
	return -1;
}

void m_remove(struct map *curr_map, char *node) {
	int index = curr_map->size;
	for (int i = 0; i < curr_map->size; i++) {
		if (strcmp(curr_map->nodes[i], node) == 0) {
			for (int j = i; j < curr_map->size - 1; j++) {
				curr_map->nodes[j] = curr_map->nodes[j+1];
				curr_map->weight[j] = curr_map->weight[j+1];
			}
			curr_map->nodes[curr_map->size] = NULL;
			curr_map->weight[curr_map->size] = 0;
			curr_map->size = curr_map->size - 1;
		}
	}
	
}

int m_size(struct map *curr_map) {
	return curr_map->size;
}

void m_free(struct map *curr_map) {
	struct map *m = (struct map *) curr_map;
	//for (int i = 0; i < curr_map->size; i++) {
		//free(curr_map->nodes[i]);
		//free(curr_map->weight[i]);
	//}
	free(m->nodes);
	free(m->weight);
	free(m);
}

void print_map(struct map *curr_map) {
	printf("%s", "{");
	for (int i = 0; i < curr_map->size; i++) {
		printf("%s", "(");
		char *nod = curr_map->nodes[i];
		int w = curr_map->weight[i];
		printf("%s", nod);
		printf("%s", ", ");
		printf("%d", w);
		printf("%s", ")");
		printf("%s", ", ");
	}
	printf("%s", "}\n");

}

