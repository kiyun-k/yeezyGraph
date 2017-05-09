#include "graph.h"

int main() {
	struct graph *g = g_init();
	struct node *n1 = n_init("abc");
	struct node *n2 = n_init("def");
	struct node *n3 = n_init("fgh");
	addNode(g, n1);
	addNode(g, n2);
	addNode(g, n3);
	addEdge(g, n1, n1, 2);
	addEdge(g, n2, n2, 2);
	addEdge(g, n1, n3, 4);
	addEdge(g, n2, n3, 4);
	addEdge(g, n1, n2, 6);
	int x = 3;
	set_data(n1, &x);
	int *b;
	b = (int *) get_data(n1);
	int d = *b;

	int k = getWeight(g, n1, n2);
	struct List *list1 = get_inNodes(n2);
	struct List *list2 = get_outNodes(n1);
	printf("edge weight: \n");
	printf("%d\n", k);
	print_list(list1);
	print_list(list2);
	printGraph(g);


	//struct node *n3 = getNode(g, "fgh");

}