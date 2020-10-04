#include <stdio.h>
#include <math.h>

double mean(double x, double y) {

  return ((x + y)/2);
} 


int main(){

  float f1, f2;
  
  printf("Please input two floating-point values separated by a space: ");
  scanf("%f %f",&f1, &f2);
  
  printf("The mean of %f and %f is %f\n",f1,f2,mean(f1, f2));
  
  return 0;
}
