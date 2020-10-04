#include <stdio.h>

int main() {
  int x, y, sum;
  printf("Enter two integer values:  ");  
  scanf("%d %d", &x, &y);

  sum = x + y + y;
  printf("The sum of %d and %d and %d", x, y, sum);
  printf(" is %d\n", sum);
  return 0;
}




