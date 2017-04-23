#ifndef __LINKEDLIST_H__
#define __LINKEDLIST_H__

struct List {
	struct node *head;
};

struct node {
	void *data;
	struct node *next;
};

void init_list(); 

void addFront(struct List *list, void *data, int index);

void addBack(struct List *list, void *data);

node* get(struct List *list, int index);

void delete(struct List *list, int index); !

void removeAll(struct List *list); ??

int contains(void *data);??

int isEmpty(struct List *list);

#endif

