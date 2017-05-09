#include "graph.h"

int main() {
	struct graph *g = g_init();
	struct node *n1 = n_init("abc");
	struct node *n2 = n_init("def");
	addNode(g, n1);
	addNode(g, n2);
	addEdge(g, n1, n2, 2);
	int x = 3;
	set_data(n1, &x);
	int *b;
	b = (int *) get_data(n1);
	int d = *b;

	//int k = getWeight(g, "abc", "def");
	//printf("edge weight: \n");
	//printf("%d\n", k);
	//struct node *n3 = getNode(g, "fgh");

}