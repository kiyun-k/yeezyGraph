struct Point {
	int x;
	int y;
}

struct Circle {
	int x;
	int y;
	string name;
}

int main() {
	struct Point p;
	struct Circle c;
	p~x = 5;
	p~y = 10;
	c~x = 1;
	c~y = 2;
	c~name = "circle";
	print(p~x);
	print(c~y);
	prints(c~name);
	return 0;
}
