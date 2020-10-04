#include <stdio.h>
#include <math.h>

int fact(int num){
  int ans = 1;  
  for(int current = 1; current <= num; current++){
    ans *= current;
  }
  return ans;
}

int main(){
  
  int N = 10;               //This will be the factorial number we calculate
  int current = 1;
  int ans = 1;

  printf("Please enter a number 0 - 10 to calculate the factorial of: ");
  scanf("%d",&N);
  printf("\n");

  if(N >= 0 && N <= 10){
    printf("The factorial of %i is %i\n", N, fact(N));
  }
  
  else {
    
    printf("Not a small (<=10) non-negative integer.\n");
    return 1;
  }
    
  return 0;
}
