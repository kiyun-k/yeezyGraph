int main() {

  float a;
  float b;
  Queue<float> q;
  q = new Queue<float>();
  a = 3.1;
  q.qadd(a);
  b = q.qfront();
  printfloat(b);


  /* b = q.qfront(); */
  /* q.qadd(c); */
  /* q.qadd(4); */
  /* q.qfront(); */

  
  return 0;
}
