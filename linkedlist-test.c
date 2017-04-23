#include <stdio.h>
#include <stdlib.h>
#include "linkedlist.h"

int main() {
	
	// init
	struct List* list = init_list();
	
	struct node *test;
	test = addFront(&list, 4);

	return 0;
}
