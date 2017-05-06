#ifndef __LINKEDLIST_H__
#define __LINKEDLIST_H__

struct List {
	struct ListNode *head;
};

struct ListNode {
	void *data;
	struct ListNode *next;
};

struct List* l_init(); 

void l_add(struct List *list, void *data);

void l_delete(struct List *list, int index);

void* l_get(struct List *list, int index);

struct ListNode* l2_get(struct List *list, int index);

int l_isEmpty(struct List *list);

#endif