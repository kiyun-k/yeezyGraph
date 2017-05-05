int main() {
	graph<string> g1;
	string a1;
	string a2;
	string a3;
	string a4;
	int x;
	bool b;
	node<string> n1;
	g1 = new graph<string>();
	a1 = "abc";
	a2 = "def";
	g1~+a1;
	g1~+a2;
	n1 = g1~_a1;
	n1.setData(a1);
	a4 = n1@data;
	prints(a4);
	n1.modifyVisited(false);
	g1.printGraph();
	b = n1@visited;
	printb(b);
	x = g1.size();
	print(x);
	g1.removeAllNodes();
	g1.printGraph();

	
}
