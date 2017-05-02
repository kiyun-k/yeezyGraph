#include "queue.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>


int main() {
	struct QueueId *q = initQueueId();
	int a = 3;
	enqueue(q, &a);
	int *b = (int *)front(q);
	printf("%d\n", *b);
};