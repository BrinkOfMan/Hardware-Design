#include <stdio.h>

int sum_input() {
  int val;  /* holds next integer value from standard input */
  int sum = 0;  /* sum of input integers so far */
  while (scanf("%d", &val) != EOF)
    sum = sum + val;
  return sum;
}

int main() {
  int val = sum_input();
  printf("The sum of input integers is %d\n", val);
}
