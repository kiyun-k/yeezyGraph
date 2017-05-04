#include "linkedlist.h"
#include <stdio.h>
#include <stdlib.h>

struct List* l_init() {
	struct List* list = (struct List*) malloc(sizeof(struct List));
	list->head = NULL;
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
	} else {
		struct ListNode* temp = list->head;
		while (temp->next != NULL) {
			temp = temp->next;
		}
		temp->next = new;
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
}

struct ListNode* l_get(struct List *list, int index) {
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

