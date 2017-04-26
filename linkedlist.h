#ifndef __LINKEDLIST_H__
#define __LINKEDLIST_H__

struct List {
	struct node *head;
};

struct node {
	void *data;
	struct node *next;
};

struct List* init_list(); 

void add(struct List *list, void *data);

void delete(struct List *list, int index);

struct node* get(struct List *list, int index);

int isEmpty(struct List *list);

#endif

