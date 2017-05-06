/*To compile: clang pqueue.c node.c map.c linkedlist.c pqueue_test.c -o pqueue_test */

#include "pqueue.h"

int main() {
	struct pqueue *pq = pq_init();

	struct node *n1 = n_init("n1");
	int x1 = 1;
	set_data(n1, &x1);
	pq_push(pq, n1);

	struct node *n2 = n_init("n2");
	int x2 = 2;
	set_data(n2, &x2);
	pq_push(pq, n2);

	struct node *n3 = n_init("n3");
	int x3 = 3;
	set_data(n3, &x3);
	pq_push(pq, n3);
	
	
	struct node *popped_n1 = pq_delete(pq);
	printf("%d\n", *((int*) popped_n1->data));

	struct node *popped_n2 = pq_delete(pq); 
	printf("%d\n", *((int*) popped_n2->data));
	

	struct node *popped_n3 = pq_delete(pq); 
	printf("%d\n", *((int*) popped_n3->data));
}