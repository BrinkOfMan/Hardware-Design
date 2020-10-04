#include <stdio.h>


int power(int base, int exp){
  int result = 1;
  for (int i = 0; i < exp; i++){
    result *= base;
  }
  
  return result;
}

int main(){

  int a, b;
  printf("Please enter two integers, separated by a space.\n");
  scanf("%i %i", &a, &b);
  printf("I will now print the first int to the power of the second int.\n");
  printf("%i\n",power(a, b));

  return 0;
}


