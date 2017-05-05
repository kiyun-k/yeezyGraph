#include "graph.h"

int main() {
	struct graph *g = g_init();
	char *a = "abc";
	struct node *n = n_init(a);
	addNode(g, n);
	int x =  4;
	char *b = "hello world";
	set_data(n, &x);
	struct node *n2 = n_init("def");
	set_data(n, "hello word");
	struct node *n1 = getNode(g, "abc");
	printf("node name: %s\n", n1->name);
	addNode(g, n);
	addNode(g, n2);
	struct node *n3 = getNode(g, "fgh");
	printGraph(g);

}