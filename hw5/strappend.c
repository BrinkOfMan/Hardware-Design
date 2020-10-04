#include <stdio.h>

void strappend(char arrc[], const char str[]){

  int i = 0;
  int position = 0;
  
  while(arrc[position] != 0)
    ++position;

  
  while(str[i] != 0){
    arrc[position] = str[i];
    ++position;
    ++i;
  }

  arrc[position] = 0;
  
}

int main(){

  char A[100] = "From start ";
  strappend(A, "to finish");
  printf("%s\n", A);

  return 0;
  
}
