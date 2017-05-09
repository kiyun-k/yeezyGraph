int main() {
	
	
	int a;
	list<int> i;

	i = new list<int>(1,2,3);
	i.l_add(4);
	i.l_delete(0);

	a = i.l_get(0);
	print(a);
	return 0;
}
