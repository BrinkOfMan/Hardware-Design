#include <stdio.h>
#include <math.h>

float moInterest(float P, float r){
  return (P * (r/(100*12)));
}

int main(){

  float principal = 10000.0;
  float interestPercent = 6.0;
  printf("Monthly interest owed with principal %.2f and %.2f percent interest/yr: $%.2f\n" ,principal, interestPercent, moInterest(principal, interestPercent));
  
  return 0;
}
  
