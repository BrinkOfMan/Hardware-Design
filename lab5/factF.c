#include <stdio.h>
#include <math.h>

int main(){
  
  int N = 10;               //This will be the factorial number we calculate
  int current = 1;
  int ans = 1;

  printf("calculating %i!\n",N);
  for (current; current < N; current++) {
    ans *= current;         //Multiply the running total (ans) by current.
  }
  
  printf("The factorial of %i is %i.\n",N,ans);
  
}
