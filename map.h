#ifndef __MAP_H__
#define __MAP_H__

struct map {
	int table_size;
	int size;
	char **nodes;
	int *weight;
};

extern struct map *m_init();

extern void m_insert(struct map *curr_map, char *node, int val);

extern int m_get(struct map *curr_map, char *node);

extern void m_remove(struct map *curr_map, char *node);

extern int m_size(struct map *curr_map);

extern void m_free(struct map *curr_map);

extern void print_map(struct map* curr_map);


#endif