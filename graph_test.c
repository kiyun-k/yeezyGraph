#include "c/graph.h"

int main() {
	struct graph *g = g_init();
	struct node *n = n_init("abc");
	addNode(g, n);
	/*set_data(n, "hello word");
	struct node *n2 = n_init("def");
	set_data(n, "hello word");

	addNode(g, n);
	addNode(g, n2);
	printf("%d size: \n", size(g));
	printf("%d empty?: \n", isEmpty(g));
	addEdge(g, n, n2, 3);
	printGraph(g);
	removeNode(g, n);
	printf("%d size: \n", size(g));
	removeAllNodes(g);
	printf("%d size: \n", size(g));
	printf("%d empty?: \n", isEmpty(g));


	printGraph(g); */
}