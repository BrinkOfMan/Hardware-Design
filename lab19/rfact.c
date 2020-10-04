#include <stdio.h>

int fact(int n) { /* n must be non-negative */
  if (n == 0)
    return 1;
  else
    return n * fact(n-1);
}

int main(){
  int x;
  printf("Please enter a non-negative integer: ");
  scanf("%d",&x);

  if(x >= 0){
    printf("The factorial of %d is %d\n",x,fact(x));
    return 0;
  }
  else{
    printf("Negative integer entered. Try again.\n");
    return -1;
  }
}
