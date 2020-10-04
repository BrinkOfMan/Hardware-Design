/* string constants */
	.section .rodata
	.align 2
prompt:				@ format string for prompt
	.asciz "Enter an integer: "
input:	 			@ format string for scanf
	.asciz "%d"
results:			@ format string for result
	.asciz "Ten times %d equals %d\n"

/* main program */
	.text
	.align 2
	.global main
main:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ two local variables
	@ [fp, #-8] holds val, the input integer
	@ [fp, #-12] holds result, 10 times the input integer

	ldr	r0, promptP	@ print prompt
	bl	printf

	ldr	r0, inputP	@ read input into val
	sub	r1, fp, #8
	bl	__isoc99_scanf

	ldr	r1, [fp, #-8]	@ multiply val by 10, store in result
	mov	r3, #10
	mul	r2, r1, r3
	str	r2, [fp, #-12]

	ldr	r0, resultsP	@ print results
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	bl	printf
	
	mov	r0, #0		@ load return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

	
/* pointer variables for format strings */
	.align	2
promptP:	.word	prompt
inputP:		.word	input
resultsP:	.word	results
