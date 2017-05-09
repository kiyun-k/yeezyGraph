#include "queue.h"

int main() {
  struct QueueId* q = initQueueId();
  struct QueueId* a = initQueueId();
  struct QueueId* b;
  enqueue(q,a);
  b=front(q);
  

}
