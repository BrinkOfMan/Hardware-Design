/* main program */
	.text
	.align	2
	.global	main
main:
	push	{fp, lr}	@ setup stack frame
	add 	fp, sp, #4
	sub	sp, sp, #8	@ 1 variable
	@ [fp, #-8] holds the return from calling get_line
	str	r0, [fp, #-8]

	ldr	r0, get_line_promptP @ call get_line
	bl	puts
	ldr	r0, buffP
	mov	r1, #100
	bl	get_line
	str	r0, [fp, #-8]	@ store return into local variable

	ldr	r0, longer_resultP	@ call longer_result
	ldr	r1, [fp, #-8]
	bl	printf

	ldr	r0, buffP	@ call put_byte(buffP, 1, 'X')
	mov	r1, #1
	mov	r2, #'X'
	bl	put_byte

	ldr	r0, buffP	@ print result of put_byte()
	bl	puts

	mov	r0, #0
	sub	sp, fp, #4	@ tear down stack frame and return
	pop	{fp, pc}

	
	@ pointer variables for format strings
	.align	2
	
buffP:		.word	buff
get_line_promptP: .word get_line_prompt
just_new_lineP:	.word 	just_new_line
longer_resultP:	.word	longer_result
	
	@ strings
	.section	.rodata @ rodata for strings
	.align 	2

get_line_prompt:
	.asciz	"\nEnter a line of input (up to 99 chars):"
just_new_line:
	.asciz "\n"
longer_result:
	.asciz "There were %d input characters\n"

	.data			@ .data for allowing modification
	.align	2
buff:	.skip	100
