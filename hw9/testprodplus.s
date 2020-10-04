/* example of coding an ARM assembly function */

/* string constants */
	.section .rodata
	.align	2
prompt:			@ format string for printf
	.asciz "Enter three integers:  "
input:			@ format string for scanf
	.asciz "%d %d %d"
results1:			@ format string for printf
	.asciz "The call prodplus(%d,%d,%d) "
results2:			@ format string for printf
	.asciz "returns %d\n"

/* function prodplus
	3 args - a, b, c, all integer values
	return - int, the value of a*b +c */
	.text
	.align 2
prodplus:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #16	@ three local variable (arguments)
	@ [fp, #-8] holds a, an integer argument
	@ [fp, #-12] holds b, and integer argument
	@ [fp, #-16] holds c, an integer argument
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]

	ldr	r0, [fp, #-8]	@ compute a*b + c
	ldr	r1, [fp, #-12]
	ldr	r2, [fp, #-16]
	mul	r0, r0, r1
	add	r0, r0, r2

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
	sub	sp, sp, #16	@ four local variables
	@ [fp, #-8] holds x, the first integer value
	@ [fp, #-12] holds y, the second integer value
	@ [fp, #-16] holds x, the third integer value
	@ [fp, #-8] holds ret, the return integer value of prodplus()
	
	ldr	r0, promptP	@ print prompt
	bl	printf

	ldr	r0, inputP	@ read values into x, y, and z
	sub	r1, fp, #8	
	sub	r2, fp, #12	
	sub	r3, fp, #16	
	bl	__isoc99_scanf

	ldr	r0, [fp, #-8]	@ call prodplus(x, y, z)
	ldr	r1, [fp, #-12]
	ldr	r2, [fp, #-16]
	bl	prodplus
	str	r0, [fp, #-20]	@ store return value in local variable ret

	ldr	r0, results1P	@ print results
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	bl	printf
	ldr	r0, results2P
	ldr	r1, [fp, #-20]
	bl	printf

	mov	r0, #0		@ load return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* pointer variables for format strings  */
	.align	2
promptP: 	.word	prompt	
inputP:		.word	input	
results1P:	.word	results1	
results2P:	.word	results2	
