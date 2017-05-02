#include "queue.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>


int main() {
	struct QueueId *q = initQueueId();
	int a = 3;
        int c = 5;
	enqueue(q, &a);
 	
};
