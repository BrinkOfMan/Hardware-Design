#include <stdio.h>
#include <math.h>

int main(){
  
  int N = 0;               //This will be the factorial number we calculate
  int current = 0;
  int ans = 1;

  printf("calculating %i!\n",N);
  while (current < N) {
    current += 1;           //Add 1 to current.
    ans *= current;         //Multiply the running total (ans) by current.
  }
  
  printf("The factorial of %i is %i.\n",N,ans);
  
}
