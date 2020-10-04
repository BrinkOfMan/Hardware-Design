#include <stdio.h>
#include <math.h>

int read_array(int a[], int size){
  
  int readAndStored = 0;
  char val;

  while (scanf("%c", &val) != EOF && readAndStored < size && val != 10){
    //Collects all values from the user, up until the size of the array, and if no newLine character is detected
    
    a[readAndStored] = val;
    //Assign character to array
    readAndStored++;     
  }

  a[readAndStored] = 0;
  
  return readAndStored;
    //Return the #elements read and stored
}

int main(){

  int arrayChars[50];
  int size = 49;
  printf("Please enter up to 50 characters: \n");

  int stored = read_array(arrayChars,size);

  printf("\n");
  //Adding a newLine character to give some white space between input/output

  /*
   printf("%s\n", arrayChars);
  Couldn't get the %s to work as it was suggested in the homework. Just going to use a loop
  */
  
  for (int i = 0; i < stored; i++){
    //Prints the character elements in the same order they were read and stored.
    printf("%c",arrayChars[i]);
  }

  printf("\nNumber of characters stored in the array: %d\n", stored);
  
  return 0;
}
  
