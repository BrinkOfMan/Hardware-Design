#include <stdio.h>

void print_bits(unsigned char mychar){
  int i;
  for(i = 0; i < 8; ++i){
    printf("%d ",((mychar << i) & 128) >> 7 );
  }
  printf("\n");
}

int main(){

  char c;
  printf("Please enter a single character: ");
  scanf("%c", &c);
  printf("The bits of %c are ",c);
  print_bits(c);
  
  return 0;
}
