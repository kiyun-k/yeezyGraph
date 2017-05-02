#ifndef __QUEUE_H__
#define __QUEUE_H__

struct Node {
	void *data;
	struct Node *next;
};

struct QueueId {
	struct Node *front;
	struct Node *rear;
	int size;
};

struct QueueId *initQueueId();
void enqueue(struct QueueId *queue, void *data);
void dequeue(struct QueueId *queue);
void *front(struct QueueId *queue);
 
#endif /* #ifndef _QUEUE_H_ */