#include <stdio.h>
#include <math.h>

float max(float x, float y) {

  if (x < y)
    return y;
  else
    return x;
} 


int main(){

  float f1, f2;
  
  printf("Please input two floating-point values separated by a space: ");
  scanf("%f %f",&f1, &f2);
  
  printf("The call max(%f, %f) returns the value  %f\n",f1,f2,max(f1, f2));
  
  return 0;
}
