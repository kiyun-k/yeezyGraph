int main() {
	Queue<int> a;
	Queue<int> x;
	int d;
	int i;
	int j;
	Queue<Queue<int>> q;
	q = new Queue<Queue<int>>();
	a = new Queue<int>();
	/* adding to a queue */
	i = 3;
	j = 5;
	a.qadd(i);
	a.qadd(j);
	q.qadd(a);
	x = q.qfront();
	d = x.qfront();
	print(d);	

}
