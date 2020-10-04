#include <stdio.h>
#include <math.h>

int main(){
  int x = 0xc93e;
  printf("The variable x is %d in decimal, %x in hexadecimal.\n",x, x);

  int y;
  printf("Please enter a hexadecimal integer value.\n(You can start with '0x', or just the hex value): ");
  scanf("%x",&y);
  printf("The variable x is %d in decimal, %x in hexadecimal.\n",y, y);
  
  return 0;
}
