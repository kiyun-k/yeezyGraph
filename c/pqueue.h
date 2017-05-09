#include "linkedlist.h"
#include "map.h"
#include "node.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifndef __PQUEUE_H__
#define __PQUEUE_H__


extern struct pqueue *pq_init();

extern void pq_push(struct pqueue *pq, struct node *n);

extern struct node *pq_delete(struct pqueue *pq);

extern bool is_empty(struct pqueue *pq);

extern int p_size(struct pqueue *pq); 



#endif
