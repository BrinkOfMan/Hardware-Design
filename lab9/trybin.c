#include <stdio.h>
#include <math.h>

int main(){

  int x = 37;

  printf("no operations done to x:\n");
  
  printf("x has value %d in decimal, 0x%x in hexadecimal\n",x, x);

  printf("\nbit-wise & operator:\n");

  printf("x has value %d in decimal, 0x%x in hexadecimal\n",x & 1, x & 1);

  printf("\nbit-wise | operator:\n");

  printf("x has value %d in decimal, 0x%x in hexadecimal\n",x | 1, x | 1);

  printf("\nbit-wise << operator:\n");

  printf("x has value %d in decimal, 0x%x in hexadecimal\n",x << 1, x << 1);

  printf("\nbit-wise << operator:\n");

  printf("x has value %d in decimal, 0x%x in hexadecimal\n",x << 4, x << 4);

  printf("\nbit-wise >> operator:\n");

  printf("x has value %d in decimal, 0x%x in hexadecimal\n",x >> 2, x >> 2);

  printf("\nbit-wise >> with & operator:\n");

  printf("x has value %d in decimal, 0x%x in hexadecimal\n",(x >> 4) & 1, (x >> 4) & 1);

  printf("\nbit-wise >> with & operator:\n");

  printf("x has value %d in decimal, 0x%x in hexadecimal\n",(x >> 5) & 1, (x >> 5) & 1);
  
  return 0;

}
