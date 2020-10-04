#include <stdio.h>
#include <math.h>

int main(){
  
  int N = 10;               //This will be the factorial number we calculate
  int current = 1;
  int ans = 1;

  printf("Please enter a number 0 - 10 to calculate all the factorials up to: ");
  scanf("%d",&N);
  printf("\n");

  if(N >= 0 && N <= 10){
  
    printf("k\tk!\n_\t_\n");
    for (current; current <= N; current++) {
      ans *= current;         //Multiply the running total (ans) by current.
      printf("%i\t%i\n",current,ans);
    }
  }
  
  else {
    
    printf("Not a small (<=10) non-negative integer.\n");
    return 1;
  }
    
  return 0;
}
