#include "graph.h"

int main() {
	struct graph *g = g_init();
	char *a = "abc";
	struct node *n = n_init(a);
	addNode(g, n);
	set_data(n, "hello word");
	struct node *n2 = n_init("def");
	set_data(n, "hello word");
	struct node *n1 = getNode(g, "abc");
	printf("node name: %s\n", n1->name);
	addNode(g, n);
	addNode(g, n2);
	struct node *n3 = getNode(g, "fgh");
	//printf("node name: %s\n", n3->name);
	printf("%d size: \n", size(g));
	printf("%d empty?: \n", isEmpty(g));
	addEdge(g, n, n2, 3);
	printGraph(g);
	removeNode(g, n);
	printf("%d size: \n", size(g));
	removeAllNodes(g);
	printf("%d size: \n", size(g));
	printf("%d empty?: \n", isEmpty(g));


	printGraph(g); 
}