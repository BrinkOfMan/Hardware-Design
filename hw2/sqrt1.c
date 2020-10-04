#include <stdio.h>
#include <math.h>

int main(){
  float x;
  printf("please input a floating-point number to calculate the square root of.\n");
  scanf("%f",&x);
  printf("float x has a value of %f, and the square root of x is %f.\n", x, sqrt(x));
  return x;
}

