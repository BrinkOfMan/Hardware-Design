#include <stdio.h>

void strncopyp(char *arrp, char *strp, unsigned int n){ //Use pointers
  int i;
  for(i = 0; i < n; ++i)
    *arrp++ = *strp++;
  
  *arrp = 0;

}

int main(){
  char A[100];
  strncopyp(A, "The end", 5);
  printf("Calling strncopyp(A, \"The end\", 5)\n");
  printf("The array A now contains string \"%s\"\n", A);
  return 0;
}
