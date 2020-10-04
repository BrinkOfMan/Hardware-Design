#include <stdio.h>
#include <math.h>

float mean(float x, float y){
  float mean;
  mean = ((x + y) / 2);
  return mean;
}

int sum_input(){
  int val;       /* holds next integer value from standard input */
  int sum = 0;   /* sum of input integers so far */
  while (scanf("%d\n", &val) != EOF) 
    sum = sum + val;
  return sum;

}

int main(){
  float num1 = 5;
  float num2 = 8;
  printf("The call mean(%f, %f) returns %f\n",num1,num2,mean(num1,num2));

  printf("Enter a sequence of integers, followed by CTRL-D\n");
  int result = sum_input();
  printf("The return value from calling sum_input() is %i\n",result);

  return 0;
}
