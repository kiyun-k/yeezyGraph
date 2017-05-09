int main() {
	graph<string> g1;
	int x;
	string a1;
	string a2;
        string a3;
	string a4;
	int y;
	node<string> n1;
	node<string> n2;
	list<string> l;
	l = new list<string>();
	g1 = new graph<string>();
	a1 = "abc";
	a2 = "def";
	g1~+a1;
	g1~+a2;
	n1 = g1~_a1;
        n1.setData("abc");
        a3 = n1@data;
        prints(a3);
	n2 = g1~_a2;
	g1[2]->(n1,n2);
	x = g1.weight(n1, n2);
	print(x);
	g1.printGraph();
	l = n1@outNodes;
	l.printList();
	y = l.lsize();
	print(y);
	return 0;
	
}
