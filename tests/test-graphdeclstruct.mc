struct nodedata {
	int dist;
	string parent;
}

int main() {

	graph<struct nodedata> g1;
	string a1;
	node<struct nodedata> n1;
	struct nodedata x;
	struct nodedata y;
	x~dist = 5;
	x~parent = "abc";
	g1 = new graph<struct nodedata>();
	a1 = "abc";
	g1~+a1;
	n1 = g1~_a1;
	n1.setData(x);
	y = n1@data;
	print(y~dist);
	
	
	

	return 0;
}
