#include <stdio.h>

int strindex(const char str[], char val){
  int i = 0;
  while(str[i] != val){
    if(str[i] == 0)
      return -1;
    ++i;
  }
  return i;
}


int main(){

  int x;
  
  x = strindex("The end", 'e');
  printf("The return value from strindex(\"The end\", 'e') is %d\n",x);

  x = strindex("The end", 'a');
  printf("The return value from strindex(\"The end\", 'a') is %d\n",x);
  
  return 0;

}
