#include <stdio.h>
#include <math.h>

int read_array(int a[], int size){
  
  int readAndStored = 0;
  int val;

  while (scanf("%d", &val) != EOF && readAndStored < size){
    //Collects all values from the user, up until the size of the array
    a[readAndStored] = val;
    readAndStored++;     
  }
  
  return readAndStored;
    //Return the #elements read and stored
}

int main(){

  int arrayInts[10];
  int size = 10;
  printf("Please enter up to 10 numbers you would like to store in an integer array, separated by a space.\nIf you want to enter less than 10 integers, hit CTRL+D to indicate you are done:\n");

  int stored = read_array(arrayInts,size);

  for (int i = stored; i > 0; i--){
    //Prints the elements in reverse order.
    printf("%d\n",arrayInts[i-1]);
  }

  printf("Number of integers stored in the array: %d\n", stored);
  
  return 0;
}
  
