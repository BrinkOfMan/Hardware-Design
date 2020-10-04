#include <stdio.h>
#include <math.h>

float mean_array(int a[], int size){      
  int i = 0;
  int sum = 0;
  while (i < size){
    sum += a[i];
    i++;
  }
  return ((sum * 1.0) / size);

}

int main(){

  int a[4] = {16, 20, 40, 82};
  float val = mean_array(a, 4);
  printf("The return value from calling mean_array() is %f\n",val);

  return 0;
}
