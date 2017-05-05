#include "c/graph.h"

int main() {
	struct graph *g = g_init();
	char *a = "abc";
	struct node *n = n_init(a);
	addNode(g, n);
	char *d = get_name(getNode(g, "abc"));
	int x = 4;
	addEdge(g, n, n, x);
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