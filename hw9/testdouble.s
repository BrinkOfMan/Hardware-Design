/* example of coding an ARM assembly function */

/* string constants */
	.section .rodata
	.align	2
prompt:			@ format string for printf
	.asciz "Enter an integer:  "
input:			@ format string for scanf
	.asciz "%d"
results:		@ format string for printf
	.asciz "The call double(%d) returns %d\n"

/* function double
	1 arg - x, an integer
	return - and integer, twice the value of x*/
	.text
	.align 2
double:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ one local variable (argument)
	@[fp, #-8] holds x, an integer argument
	str	r0, [fp, #-8]

	ldr	r0, [fp, #-8]	@ compute 2*x
	add	r0, r0, r0

	@ r0 now holds the value we want, begin teardown
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}
	
/* main program */
	.text
	.align	2
	.global main
main:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ two local variables
	@ [fp, #-8] holds x, an integer value
	@ [fp, #-12] holds ret, the return integer value from double(x)

	ldr	r0, promptP	@ print prompt
	bl	printf

	ldr	r0, inputP	@ read value into x
	sub	r1, fp, #8	
	bl	__isoc99_scanf

	ldr	r0, [fp, #-8]	@ call double(x)
	bl	double
	str	r0, [fp, #-12]	@ store return value in local variable ret

	ldr	r0, resultsP	@ print results
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	bl	printf

	mov	r0, #0		@ load return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* pointer variables for format strings  */
	.align	2
promptP: 	.word	prompt	
inputP:		.word	input	
resultsP:	.word	results	
