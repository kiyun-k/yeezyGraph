int main() {
	graph<string> g1;
	string a1;
	string a2;
	string a3;
	string a4;
	string a5;
	/*int x;*/
	/*bool b;*/
	node<string> n1;
	node<string> n2;
	g1 = new graph<string>();
	a1 = "abc";
	a2 = "def";
	g1~+a1;
	g1~+a2;

	n1 = g1~_a1;
	n1.setData(a1);

	n2 = g1~_a2;
	n2.setData(a2);
	g1[2]->(n1,n2);

	a4 = n1@data;
	a3 = n2@data;

	prints(a4);
	prints(a3);

	a5 = n1@name;
	prints(a5);


	n1.modifyVisited(false);
	g1.printGraph();
	/*b = n1@visited;
	printb(b);*/
	/*x = g1.size();
	print(x);*/
	g1.removeAllNodes();
	g1.printGraph();
	return 0;
	
}
