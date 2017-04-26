#include "linkedlist.h"
#include <stdio.h>
#include <stdlib.h>

struct List* init_list() {
	struct List* list = (struct List*) malloc(sizeof(struct List));
	list->head = NULL;
	return list;
}

void add(struct List *list, void *data) {
	struct node* new = (struct node*) malloc(sizeof(struct node));
	if (new == NULL) 
		return;

	new->data = data;
	new->next = NULL; 
	if (list->head == NULL) {
		list->head = new;
	} else {
		struct node* temp = list->head;
		while (temp->next != NULL) {
			temp = temp->next;
		}
		temp->next = new;
	}
}
void delete(struct List *list, int index) {
	if (isEmpty(list)) {
		return;
	}
	if (index == 0) {
		struct node* temp = list->head;
		list->head = list->head->next;
		free(temp);
		return;
	}
	
	int ctr = 0;
	struct node* temp = list->head;
	while(ctr < index-1) {
		temp = temp->next;	
		ctr++;	
	}
	temp->next = temp->next->next;
	temp = temp->next;
	free(temp);
}

struct node* get(struct List *list, int index) {
	struct node* temp = list->head;
	while (index > 0) {
		temp = temp->next;
		index--;
	}
	return temp;
}


int isEmpty(struct List *list) {
	return (list->head == NULL);
}

