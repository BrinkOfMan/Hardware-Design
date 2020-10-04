#include <stdio.h>

int strlen(const char *strp){
  int i;
  for(i = 0; strp[i] != 0; ++i) {} // Length of the string (including null)
  return i - 1;
}



int main(){

  printf("The return value from strlen(\"The end\") is %d\n",strlen("The end"));
  
  return 0;
}
