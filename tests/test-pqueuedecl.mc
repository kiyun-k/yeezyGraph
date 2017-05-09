int main() {

	pqueue p;
	graph<int> g1;
	string a1;
	string a2;
	string a3;
	node<int> n1;
	node<int> n2;
	node<int> n3;

	g1 = new graph<int>();
	a1 = "abc";
	a2 = "def";
	a3 = "ghi";
	g1~+a1;
	g1~+a2;
	g1~+a3;

	n1 = g1~_a1;
	n1.setData(3);
	/*
	n2 = g1~_a2;
	n2.setData(1);

	n3 = g1~_a3;
	n3.setData(3);

	p = new pqueue(n1);	
	p.p_push(n2);
	/*p.p_delete();*/

	return 0;

}
