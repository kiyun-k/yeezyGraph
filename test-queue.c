#include "queue.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>


int main() {
	struct QueueId *q = initQueueId();
	float a = 3.1;
        float c = 5.2;
	enqueue(q, &a);
	float *d = (float *)front(q);
 	
};
