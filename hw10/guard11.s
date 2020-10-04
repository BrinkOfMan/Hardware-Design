/* example of guard in assembly
	Test cases: -1 8, 0 8, 1 7, 1 1 */

	
/* format strings for I/O */	
	.section 	.rodata
	.align	2
prompt:	.asciz "Enter two integers x and y: "
	.align	2
scanf_fmt:
	.asciz "%d %d"
	.align	2
t_msg:	.asciz "guard returns true\n"
	.align	2
f_msg:	.asciz "guard returns false\n"

/* main program */
	.text
	.align	2
	.global	main
main:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ #8 for 2 local variables
	@ [fp, #-8] is x, first integer variable
	@ [fp, #-12] is y, second integer variable

	ldr	r0, promptP	@ print prompt
	bl	printf
	ldr	r0, scanf_fmtP  @ read values of x and y
	sub	r1, fp, #8
	sub	r2, fp, #12
	bl	__isoc99_scanf

	ldr	r0, [fp, #-8]	@ if x+y > 7
	ldr	r1, [fp, #-12]
	add	r0, r0, r1
	cmp	r0, #7		
	bgt	true
	
	ldr	r0, [fp, #-8]	@  || x <= 0
	cmp	r0, #0
	bgt	else
true:	
	ldr	r0, t_msgP	@ print true message
	bl	printf
	b	next

else:
	ldr	r0, f_msgP	@ otherwise print false message	
	bl	printf

next:
	mov	r0, #0		@ assign 0 as return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* pointer variables for format strings */
	.align	2
promptP:
	.word	prompt
scanf_fmtP:
	.word	scanf_fmt	
t_msgP:
	.word	t_msg
f_msgP:
	.word	f_msg
