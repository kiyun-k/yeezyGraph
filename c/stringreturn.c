#include <stdio.h>

char *foo()
{
  char *x;
  x = "hello";
  return x;
}

int main()
{
  char *s;
  s = foo();
  printf("%s", s);
  return 0;
}
