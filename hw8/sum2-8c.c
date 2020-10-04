#include <stdio.h>

int main() {
  int x, y, sum;
  printf("Enter two integer values:  ");  
  scanf("%d %d", &x, &y);

  sum = x + y + y;
  printf("The sum of %d and twice %d is %d\n", x, y, sum);
  return 0;
}




