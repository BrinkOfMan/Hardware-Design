#include <stdio.h>

void strappendp(char *arrp, const char *strp){

  int i = 0;
  int position = 0;
  
  while(*arrp != 0)
    arrp++;
  
  while(*strp != 0)
    *arrp++ = *strp++;

  *arrp = 0;
  
}

int main(){

  char A[100] = "From start ";
  printf("Array A begins with string \"From start \"\n");
  printf("Calling strappendp(A, \"to finish\")\n");
  
  strappendp(A, "to finish");
  printf("Array A now begins with string %s\n", A);

  return 0;
  
}
