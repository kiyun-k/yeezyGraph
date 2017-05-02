#include "queue.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>


int main() {
	struct QueueId *q = initQueueId();
	double a = 3.1;
	enqueue(q, &a);
	double *b = (double *)front(q);
	printf("%f\n", *b);
};