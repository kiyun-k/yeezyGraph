#include "pqueue.h"
#include <stdio.h>
#include <string.h>

int main() {
	struct node* n = n_init("hi");
	struct pqueue *p = pq_init();
	
	pq_push(p,n);

	return 0;

}
