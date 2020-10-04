#include <stdio.h>

int main() {
  int x, y, sum;
  printf("Enter two integer values:  ");  
  scanf("%d %d", &x, &y);

  sum = x + y - 3;
  printf("The sum of %d and %d minus 3 is %d\n", x, y, sum);
  return 0;
}




