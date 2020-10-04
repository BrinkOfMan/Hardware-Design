#include<stdio.h>
#include<math.h>

void strncopy(char arrc[], const char str[], int n){

  int position = 0;
  while(arrc[position] != 0 && position < n){

    arrc[position] = str[position];
    
    position++;
  }

  arrc[position] = 0;
  
}

int main(){

  char A[100];

  printf("Calling strncopy(A, \"The end\", 5):\n");
  strncopy(A, "The end", 5);

  printf("The array now contains string \"%s\"\n", A);

  return 0;

}
