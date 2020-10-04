#include <stdio.h>

int sum_array(int a[], int size) {
  int sum = 0;
  int i = 0;
  while (i < size){
    sum = sum + a[i];
    i++;
  }
  return sum;
}

int main() {
  int arr[4] = {16, 40, 20, 82};
  int val = sum_array(arr, 4);
  printf("The sum of input integers is %d\n", val);
}
