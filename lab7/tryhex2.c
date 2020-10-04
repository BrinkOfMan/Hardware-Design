#include <stdio.h>
#include <math.h>

int main(){
  int x = 0xc93e;
  printf("The variable x is %d in decimal, %x in hexadecimal.\n",x, x);

  int y;
  printf("Please enter a decimal integer value: ");
  scanf("%d",&y);
  printf("The variable x is %d in decimal, %x in hexadecimal.\n",y, y);
  
  return 0;
}
