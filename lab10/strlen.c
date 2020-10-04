#include <stdio.h>
#include <math.h>

int strlen(const char arrc[]){
  int len = 0;
  int i;
  
  for(i = 0; i < 100; ++i){
    if(arrc[i] != 0)
      ++len;
  }
  
  return len;
}

int main(){

  int x;
  x = strlen("The end");
  printf("The result of our call to strlen(\"The end\") is: %d\n",x);

  return 0;
  
}
