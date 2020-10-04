#include <stdio.h>

int main() {
  int x, y, sum;
  printf("Enter two integer values:  ");  
  scanf("%d %d", &x, &y);

  sum = x + y + x;
  printf("The sum of twice %d and %d is %d\n", x, y, sum);
  return 0;
}
