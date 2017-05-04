#include "linkedlist.h"
#include <stdlib.h>
#include <stdio.h>

int main() {
	struct List *l = l_init();
	int a = 1;
	int b = 2;
	int c = 3;
	l_add(l, &a);
	l_add(l, &b);
	l_add(l, &c);
	l_delete(l,0);
	return 0;
}
