int main() {

  int a;
  int b;
  int c;
  Queue<int> q;
  a = 3;
  c = 5;
  q = new Queue<int>();
  q.qadd(a);
  b = q.qfront();
  q.qremove(); 
  /* q.qadd(c); */
  /* q.qadd(4); */
  /* q.qfront(); */
  print(b);
  
  return 0;
}
