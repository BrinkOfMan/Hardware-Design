/* string constants */
	.section .rodata
	.align	2
prompt:			@ format string for printf
	.asciz "Enter two integers:  "
input:			@ format string for scanf
	.asciz "%d %d"
results:			@ format string for printf
	.asciz "The call pow(%d, %d) returns %d\n"

/* function pow
	2 arguments - x and p, both integers
	return - an integer, x^p
	*/
	.text
	.align 2
pow:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #16	@ 2 arguments, 2 local variable
	@ [fp, #-8] holds x, an int
	@ [fp, #-12] holds p, an int
	@ [fp, #-16] holds the value x^p
	@ [fp, #-20] holds i, an iteration guard
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]

	ldr	r0, [fp, #-8]	@ initialize total to x
	str	r0, [fp, #-16]
	
	mov	r2, #1		@ initialize i to 1
	str	r2, [fp, #-20]
	b	guard

body:	
	ldr	r0, [fp, #-8]	@ compute x*x or x*(current total)
	ldr	r1, [fp, #-16]
	mul	r0, r0, r1
	str	r0, [fp, #-16]	@ store the new total

	ldr	r1, [fp, #-20]	@ add 1 to i
	add	r1, r1, #1
	str	r1, [fp, #-20]

guard:
	ldr	r1, [fp, #-20]	@ i
	ldr	r2, [fp, #-12]	@ p
	cmp	r1, r2		@ if i < p
	blt	body		@ multiply again
	
	ldr	r0, [fp, #-16]	@ load return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* main program */
	.text
	.align	2
	.global main
main:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #16	@ 3 local variables
	@ [fp, #-8] holds x, an integer
	@ [fp, #-12] holds p, an integer
	@ [fp, #-16] holds ret, x^p

	ldr	r0, promptP	@ print prompt
	bl	printf

	ldr	r0, inputP	@ read values into x and p
	sub	r1, fp, #8	
	sub	r2, fp, #12	
	bl	__isoc99_scanf

	ldr	r0, [fp, #-8]	@ call pow(x, p)
	ldr	r1, [fp, #-12]	
	bl	pow
	str	r0, [fp, #-16]	@ store return value in local variable ret

	ldr	r0, resultsP	@ print results
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	bl	printf

	mov	r0, #0		@ load return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* pointer variables for format strings  */
	.align	2
promptP: 	.word	prompt	
inputP:		.word	input	
resultsP:	.word	results	
