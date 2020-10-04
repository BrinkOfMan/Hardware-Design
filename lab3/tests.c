#include <stdio.h>
#include <math.h>

/*
 I didn't read ahead to #9, so I guess this is a combination of both tests.c and tests2.c
 I'll write another program file just telling you to come back here
 Sorry for any confusion
 */

int main(){	
	float v = 3.1415;
	//using a nested if to test if 0, + or -
	printf("test 1 to see if 3 is 0/+/-\n");
	if (v >= 0){
		if (v > 0)
			printf("v is positive at %f\n\n", v);
		else
			printf("v is 0\n\n");
	}
	else
		printf("v is negative at %f\n\n", v);	
	
	v = -2;
	printf("test 2 to see if -2 is 0/+/-\n");
	if (v >= 0){
		if (v > 0)
			printf("v is positive at %f\n\n", v);
		else
			printf("v is 0\n\n");
	}
	else
		printf("v is negative at %f\n\n", v);
		
	v = 0;
	printf("test 3 to see if 0 is 0/+/-\n");
	if (v >= 0){
		if (v > 0)
			printf("v is positive at %f\n\n", v);
		else
			printf("v is 0\n\n");
	}
	else
		printf("v is negative at %f\n\n", v);	
	
	float f = 4.0;
	//using a guard to test if this floating point is the same value as its integer form
	printf("test 1 to see if 4.0 is an integer\n");
	if ((int) f == f)
		printf("float %f is an integer\n\n",f);
	else
		printf("float %f is not an integer\n\n",f);
		
	f = 4.1;
	printf("test 2 to see if 4.1 is an integer\n");
	if ((int) f == f)
		printf("float %f is an integer\n\n",f);
	else
		printf("float %f is not an integer\n\n",f);
		
	int i = 25;
	//using a guard to test if the square root of this number is an integer
	printf("test 1 to see if sqrt 25 is an integer\n");
	if (sqrt(i) == (int) sqrt(i))
		printf("The square root of %i is an integer, %i\n\n", i, (int) sqrt(i));
	else
		printf("The square root of %i is not an integer, %f\n\n", i, sqrt(i));
		
	i = 20;
	printf("test 2 to see if sqrt 20 is an integer\n");
	if (sqrt(i) == (int) sqrt(i))
		printf("The square root of %i is an integer, %f\n\n", i, (int) sqrt(i));
	else
		printf("The square root of %i is not an integer, %f\n\n", i, sqrt(i));
		
}
