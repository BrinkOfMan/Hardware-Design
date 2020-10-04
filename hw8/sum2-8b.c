#include <stdio.h>

int main() {
  int x, y, sum;
  printf("Enter two integer values:  ");  
  scanf("%d %d", &x, &y);
  printf("x has the value %d\n", x);

  sum = x + y;
  printf("The sum of %d and %d is %d\n", x, y, sum);
  return 0;
}




