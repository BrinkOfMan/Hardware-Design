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
  
  int N;

  printf("Please enter a number 0 - 10 to calculate all factorial up to: ");
  scanf("%d",&N);
  printf("\n");

  if(N >= 0 && N <= 10){
    printf("k\tk!\n_\t_\n");
    for(int i = 0; i <= N; i++){
      printf("%i\t%i\n", i, fact(i));
    }
  } 
  
  else {
    
    printf("Not a small (<=10) non-negative integer.\n");
    return 1;
  }
    
  return 0;
}
