#include "linkedlist.h"
#include <stdio.h>
#include <stdlib.h>

struct List* l_init() {
	struct List* list = (struct List*) malloc(sizeof(struct List));
	list->head = NULL;
	list->size = 0;
	return list;
}

void l_add(struct List *list, void *data) {
	struct ListNode* new = (struct ListNode*) malloc(sizeof(struct ListNode));
	if (new == NULL) 
		return;

	new->data = data;
	new->next = NULL; 
	if (list->head == NULL) {
		list->head = new;
		list->size++;
	} else {
		struct ListNode* temp = list->head;
		while (temp->next != NULL) {
			temp = temp->next;
		}
		temp->next = new;
		list->size++;
	}
}
void l_delete(struct List *list, int index) {
	if (l_isEmpty(list)) {
		return;
	}
	if (index == 0) {
		struct ListNode* temp = list->head;
		list->head = list->head->next;
		free(temp);
		list->size--;
		return;
	}
	
	int ctr = 0;
	struct ListNode* temp = list->head;
	while(ctr < index-1) {
		temp = temp->next;	
		ctr++;	
	}
	temp->next = temp->next->next;
	temp = temp->next;
	free(temp);
	list->size--;
}

void* l_get(struct List *list, int index) {
	struct ListNode* temp = list->head;
	while (index > 0) {
		temp = temp->next;
		index--;
	}
	return temp->data;
}

struct ListNode* l2_get(struct List *list, int index) {
	struct ListNode* temp = list->head;
	while (index > 0) {
		temp = temp->next;
		index--;
	}
	return temp;
}


int l_isEmpty(struct List *list) {
	return (list->head == NULL);
}

int l_size(struct List *list) {
	return (list->size);
}

void print_list(struct List *list) {
	printf("%s", "{");
	for (int i = 0; i < list->size; i++) {
		char *nod = l_get(list, i);
		printf("%s", nod);
		printf("%s", ", ");
	}
	printf("%s", "}\n");

}


