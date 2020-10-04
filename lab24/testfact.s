/* example of coding an ARM assembly function */

/* string constants */
	.section .rodata
	.align	2
prompt:			@ format string for printf
	.asciz "Enter an integer:  "
input:			@ format string for scanf
	.asciz "%d"
results:			@ format string for printf
	.asciz "The call fact(%d) returns %d\n"

/* function fact
	1 argument - n, and integer
	state change - if n is less than or equal to 1, return 1
	return - n * fact(n-1)*/
	.text
	.align 2
fact:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ one argument
	@ [fp, #-8] holds n, and integer
	str	r0, [fp, #-8]

	mov	r2, #1		@ if n <= 1
	ldr	r1, [fp, #-8]
	cmp	r1, r2
	ble	if		@ return 1

	ldr	r0, [fp, #-8]	@ else, return n * fact(n-1)
	sub	r0, #1
	bl	fact		@ call fact(n-1)
	ldr	r1, [fp, #-8]	
	mul	r0, r0, r1	@ n * fact(n-1)
		
	@ r0 holds desired value, begin tear down
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}
	
if:		
	mov	r0, #1		@ return 1
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
	@ [fp, #-8] holds x, an integer
	@ [fp, #-12] holds ret, an integer

	ldr	r0, promptP	@ print prompt
	bl	printf

	ldr	r0, inputP	@ read value into x
	sub	r1, fp, #8	
	bl	__isoc99_scanf

	ldr	r0, [fp, #-8]	@ call fact(x)
	bl	fact
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
