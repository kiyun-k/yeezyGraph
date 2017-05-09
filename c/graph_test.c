#include "graph.h"
#include "linkedlist.h"

int main() {
	struct graph *g = g_init();
	struct node *n1 = n_init("abc");
	struct node *n2 = n_init("def");
	struct node *n3 = n_init("fgh");
	addNode(g, n1);
	addNode(g, n2);
	
	addEdge(g, n1, n2, 2);
	
	struct List *list1 = get_inNodes(n2);
	
		char *a = l_get(list1, 0);
		printf("error?\n");
		printf("%s", a);



	//struct node *n3 = getNode(g, "fgh");

}