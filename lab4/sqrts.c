#include <stdio.h>
#include <math.h>

int main(){
  
  int N = 5;      /* number of square roots to print */
  int count = 0;  /* loop control variable */

  /* invariant: count square roots have been printed so far */

  printf("x\tsqrt(x)\n-\t-------\n");
  while (count < N) {
  printf("%d\t%f\n", count+1, sqrt(count+1));
  count = count + 1;
  }

}
