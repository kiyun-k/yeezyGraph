int main() {
	graph<string> g1;
	int x;
	string a1;
	string a2;
        string a3;
	node<string> n1;
	node<string> n2;
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
	x = g1.weight(a1, a2);
	print(x);
	g1.printGraph();
	return 0;
	
}
