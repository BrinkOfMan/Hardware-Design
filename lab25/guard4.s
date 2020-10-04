/* format strings for I/O */	
	.section 	.rodata
	.align	2
prompt:	.asciz "Enter a character: "
	.align	2
	
scanf_fmt:
	.asciz "%c"

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

	ldr	r0, [fp, #-8]	@ if x < '0' (48)
	mov	r1, #'0'
	cmp	r0, r1		
	bge	else
	
	ldr	r0, lt_msgP	@ print less-than message
	ldr	r1, [fp, #-8]	
	bl	printf
	b	next

else:
	ldr	r0, [fp, #-8]	@ if x <= '9' (57)
	mov	r1, #'9'
	cmp	r0, r1
	bgt	else2

	ldr	r0, betweenP	@ print between message
	ldr	r1, [fp, #-8]
	bl	printf
	b	next
	
else2:
	ldr	r0, gt_msgP	@ otherwise print greater-than message
	ldr	r1, [fp, #-8]	
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
lt_msgP:
	.word	lt_msg
gt_msgP:
	.word	gt_msg
betweenP:
	.word	between
