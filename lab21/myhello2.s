/* string constants */	
	.section	.rodata
	.align	2
greeting:			@ format string for printf
        .asciz "Hello, world!\n"
	.align 2
salutation:
	.asciz "Hello, computer.\n"
	.align 2
hex:
	.asciz "%d in hexadecimal notation is 0x%x\n"

/* main program */
	.text
	.align 	2
	.global	main
main:
	push	{fp, lr}	@ set up stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ no local variables
	
	ldr	r0, greetingsP	@ call printf()
	bl	printf

	ldr	r0, salutationsP @call the salutation printf()
	bl	printf

	ldr	r0, hexadecimalP @call the hex printf()
	ldr	r1, lit
	ldr	r2, lit
	bl	printf
	
	mov	r0, #0		@ load return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* pointer variable(s) for format strings */	
	.align	2
greetingsP:
	.word	greeting	@ pointer variable to string greeting
salutationsP:	
	.word	salutation
hexadecimalP:
	.word	hex

/* literal memory locations */
	.align 2
lit:
	.word	729
