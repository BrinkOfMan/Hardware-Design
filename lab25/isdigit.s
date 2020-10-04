/* format strings for I/O */	
	.section 	.rodata
	.align	2
prompt:	.asciz "Enter a number: "
	.align	2
	
scanf_fmt:
	.asciz "%d"
	.align 2
result:
	.asciz "is %d an ascii character?\n%d\n"

/* function isdigit
	1 argument - val, an int
	return - 1 if an ascii digit, 0 otherwise */
	.text
	.align 2
isdigit:	
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ #8 for 1 argument and 1 local variable
	@ [fp, #-8] is x, first integer variable
	@ [fp, #-12] is the bool return value
	str	r0, [fp, #-8]
	
	ldr	r0, [fp, #-8]	@ if x < '0' (48)
	mov	r1, #'0'
	cmp	r0, r1		
	bge	else
	
	mov	r0, #0		@ return 0
	str	r0, [fp, #-12]
	b	next

else:
	ldr	r0, [fp, #-8]	@ otherwise if x <= '9' (57)
	mov	r1, #'9'
	cmp	r0, r1
	bgt	else2

	mov	r0, #1		@ return 1
	str	r0, [fp, #-12]
	b	next
	
else2:
	mov	r0, #0		@ otherwise return 0
	str	r0, [fp, #-12]	
	b	next

next:
	ldr	r0, [fp, #-12]	@ load return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* main program */
	.text
	.align	2
	.global	main
main:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ #8 for 1 local variable
	@ [fp, #-8] is x, first integer variable

	ldr	r0, promptP	@ print prompt
	bl	printf
	ldr	r0, scanf_fmtP  @ read value of x
	sub	r1, fp, #8
	bl	__isoc99_scanf

	ldr	r0, [fp, #-8]	@ call isdigit(x)
	bl	isdigit
	
	mov	r2, r0		@ print result
	ldr	r0, resultP
	ldr	r1, [fp, #-8]
	bl	printf

	mov	r0, #0		@ assign 0 as return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* pointer variables for format strings */
	.align	2
promptP:
	.word	prompt
scanf_fmtP:
	.word	scanf_fmt	
resultP:
	.word result

