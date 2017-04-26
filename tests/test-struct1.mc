struct Point {
	int x;
	int y;
}

int main() {
	struct Point p;
	p~x = 5;
	p~y = 10;
	print(p~x);
	return 0;
}