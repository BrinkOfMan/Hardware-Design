#include <stdio.h>
#include <math.h>

int prod_array(int a[], int size){
  int i, prod = 1;
  for(i = 0; i < size; i++)
    prod *= a[i];
  return prod;
}

int main(){

  int a[3] = {1, 2, 4};
  int val = prod_array(a, 3);
  printf("The product of array elements is %d.\n", val);
  
  return 0;

}
