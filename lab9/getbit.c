#include<stdio.h>
#include<math.h>

int getbit(int val, int bitno){

  return((val >> bitno) & 1);
  
}

int main(){

  int i;
  printf("Please input a hexadecimal integer: ");

  scanf("%x",&i);

  int j;
  for(j = 7; j >= 0; j--){
    
    printf("%d ",getbit(i,j));

  }
  
  printf("\n");
  
}
