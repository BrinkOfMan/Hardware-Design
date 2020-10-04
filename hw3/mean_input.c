#include <stdio.h>
#include <math.h>

float mean_input(){
  int val;       
  int count = 0;
  int sum = 0;
  while (scanf("%d\n", &val) != EOF){
    sum += val;
    count++;
  }
  return ((sum * 1.0) / count);

}

int main(){

  printf("Enter a sequence of integers, followed by CTRL-D\n");
  printf("The return value from calling mean_input() is %f\n",mean_input());

  return 0;
}
