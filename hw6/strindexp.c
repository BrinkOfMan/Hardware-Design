#include <stdio.h>

int strindexp(const char *strp, char val){
  int i = 0;
  while(*strp != val){
    if(*strp == 0)
      return -1;
    ++i;
    ++strp;
  }
  return i;
}


int main(){

  int x;
  
  x = strindexp("The end", 'e');
  printf("The return value from strindex(\"The end\", 'e') is %d\n",x);

  x = strindexp("The end", 'a');
  printf("The return value from strindex(\"The end\", 'a') is %d\n",x);
  
  return 0;

}
