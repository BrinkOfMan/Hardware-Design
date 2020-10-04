#include <stdio.h>
#include <math.h>

int main(){
  
  int N = 5;      /* number of square roots to print */

  printf("x\tsqrt(x)\n-\t-------\n");
  for (int count = 0; count < N; count++) {
    printf("%d\t%f\n", count+1, sqrt(count+1));
  }

}
