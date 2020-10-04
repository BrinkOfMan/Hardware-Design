/* strings */
	.section .rodata
	.align 2
prompt:		@ format string for printf
	.asciz "Enter a positive integer: "
scan:		@ format string for scanf
	.asciz "%d"
result:		@ format string for printf
	.asciz "The sum of the first %d squares is %d.\n"

/* function square
	1 arg - integer value x
	return - integer, x squared */
	.text
	.align 2
square:	
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ one local variable (argument)
	@ [fp, #-8] holds x, integer argument
	str	r0, [fp, #-8]

	ldr	r0, [fp, #-8]	@ compute x squared
	mul	r0, r0, r0

	@ r0 holds desired value, begin teardown
	sub	sp, fp, #4
	pop	{fp, pc}
	
/* main program */
	.text
	.align 2
	.global main
main:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #16	@ three local variables
	@ [fp, #-8] holds n, an integer
	@ [fp, #-12] holds result, an integer
	@ [fp, #-16] holds i, an integer
	mov	r0, #0
	str	r0, [fp, #-12]

	ldr	r0, promptP	@ print prompt
	bl	printf

	ldr	r0, scanP	@ scan and load values
	sub	r1, fp, #8
	bl	__isoc99_scanf

	mov	r2, #0		@ initialize i to 0
	str	r2, [fp, #-16]
	b	guard		@ loop to add sum of squares

body:	
	ldr	r0, [fp, #-8]	@ call square(x)
	bl	square
	ldr	r1, [fp, #-12]	@ load in result
	add	r0, r0, r1	@ return value + current result
	str	r0, [fp, #-12]	@ store sum in result

	ldr	r1, [fp, #-16]	@ add 1 to i
	add	r1, r1, #1
	str	r1, [fp, #-16]
	

guard:
	ldr	r1, [fp, #-16]	@ i
	ldr	r2, [fp, #-8]	@ n
	cmp	r1, r2		@ if i <= n
	ble	body		@ loop back to body

	ldr	r0, resultP	@ print results
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	bl	printf
	
	mov	r0, #0		@ load return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* string pointers */
	.align 2
promptP:	.word	prompt
scanP:	 	.word	scan
resultP:	.word	result
