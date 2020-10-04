/* example of assembly programming -
   RAB 11/13/19 */

/* string constants */	
	.section	.rodata
	.align	2
greeting:			@ format string for printf
        .asciz "Hello, world!\n"  @ NOTE: .asciZ auto adds nullbyte

/* main program */
	.text
	.align 	2
	.global	main
main:
	push	{fp, lr}	@ set up stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ no local variables
	
	ldr	r0, greetingP	@ call printf()
	bl	printf

	mov	r0, #0		@ load return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* pointer variable(s) for format strings */	
	.align	2
greetingP:
	.word	greeting	@ pointer variable to string greeting
