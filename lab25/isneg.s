/* function isneg
	1 argument - val, an integer
	return - 0 if val is positive, 1 if negative */
	.text
	.align 2
isneg:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ 1 argument
	@ [fp, #-8] holds val, an integer argument
	str	r0, [fp, #-8]

	ldr	r0, [fp, #-8]	@ if val < 0
	mov	r1, #0
	cmp	r0, r1
	bge	positive

	mov	r0, #1		@ val is negative
	sub	sp, fp, #4	@ tear down stack frame and return
	pop	{fp, pc}
	
positive:	
	mov	r0, #0		@ otherwise, val is positive
	sub	sp, fp, #4	@ tear down stack frame and return
	pop	{fp, pc}

/* main program */
	.text
	.align	2
	.global	main
main:
	push	{fp, lr}	@ setup stack frame
	add 	fp, sp, #4
	sub	sp, sp, #8	@ 1 local variable
	@ [fp, #-8] holds val, an int

	ldr	r0, get_int_promptP 	@ prompt for int
	bl	printf
	ldr	r0, get_int_scanP	@ call scanf
	sub	r1, fp, #8
	bl	__isoc99_scanf

	ldr	r0, [fp, #-8]		@ call isneg(val)
	bl	isneg
	mov	r2, r0
	ldr	r0, resultP		@ print result
	ldr	r1, [fp, #-8]
	bl	printf
	
	mov	r0, #0
	sub	sp, fp, #4	@ tear down stack frame and return
	pop	{fp, pc}

/* pointer variables for format strings */
	
	.align	2
get_int_promptP: .word	get_int_prompt
get_int_scanP:	.word	get_int_scan
resultP:	.word	result
	
/* string constants */
	
	.section	.rodata
	.align 	2

get_int_prompt:		@ format string for printf
	.asciz	"Enter an integer: "
	.align 2
get_int_scan:		@ format string for scanf
	.asciz	"%d"
	.align 2
result:			@ format string for printf
	.asciz	"Is %d negative?\n%d\n"
	.align 2
