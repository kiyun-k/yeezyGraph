#include "linkedlist.h"
#include <stdio.h>
#include <stdlib.h>

void init_list() {
	struct List* list = (struct List*) malloc(sizeof(struct List));
	list->head = NULL;
}

void addFront(struct List *list, void *data) {
	struct node* new = (struct node*) malloc(sizeof(struct node));
	if (node == NULL) 
		return 
	new->data = data;
	new->next = list->head;
	list->head = new;
}

void addBack(struct List *list, void *data) {
	struct node* new = (struct node*) malloc(sizeof(struct node));
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

node* get(struct List *list, int index) {
	struct node* temp = list->head;
	while (index > 0) {
		temp = temp->next;
		idx—-;
	}
	return temp;
}

void delete(struct List *list, int index){
	struct node* temp = list->head;
	while (index > 0) {
		temp = temp->next;
	//how to dealloc oops
	}
	
}



int contains(void *data) {
	struct node* temp = list->head;
	while (temp->next != NULL) {
		if (temp->data == data) {
			return 1;
		}
		temp = temp->next;
	}
	return 0;
}

int isEmpty(struct List *list) {
	return (list->head == NULL);
}

