/* function get_trans
	1 arg - string representing an input line
	state change - check whether the line has correct format:
	character, space, character, newline.
	If correct, extract the first and third characters from the buffer using get_byte and store them in registers r4 (inchar) and r5 (outchar)
	return - 0 if incorrect format, 1 if correct */
	
	.text
	.align	2
get_trans:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ one local variable
	@ [fp, #-8] holds a string representing an input line
	str	r0, [fp, #-8]

	ldr	r0, [fp, #-8]	@ check if format is correct (' ')
	mov	r1, #1
	bl	get_byte
	mov	r1, #' '
	cmp	r0, r1
	bne	error
	mov	r0, r4		@ moving r0 (' ') into r4

	ldr	r0, [fp, #-8]	@ check if format is correct ('\n')
	mov	r1, #3
	bl	get_byte
	mov	r1, #'\n'
	cmp	r0, r1
	bne	error
	mov	r0, r5		@ moving r0 ('\n') into r5
	
	mov	r0, #1		@ return 1 if correct
	sub	sp, fp, #4	@ tear down stack frame and return
	pop	{fp, pc}

error:
	mov	r0, #0		@ return 0 if an error in formatting
	sub	sp, fp, #4
	pop	{fp, pc}

/* function translate
	1 arg - a non-const and non-empty string
	state change - replace first character of that argument by a '*'
	return - replaced string */
	.text
	.align 2
translate:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ 1 arg
	@ [fp, #-8] holds a non-const, non-empty string
	str	r0, [fp, #-8]

	ldr	r0, [fp, #-8]	@ replacing the first character with '*'
	mov	r1, #0
	mov	r2, #'*'
	bl	put_byte

	@ r0 holds the value we want, begin tear down
	sub	sp, fp, #4	@ tear down stack frame and return
	pop	{fp, pc}

/* function print_summary
	0 args
	state change - (for 1st stage version) print the header line in the
	output described by the function spec in the Proj 0 file
	return - nothing */
	.text
	.align 2
print_summary:
	push	{fp, lr} 	@ setup stack frame
	add 	fp, sp, #4
	sub	sp, sp, #8	@ 0 arguments

	ldr	r0, summaryP	@ print 'Summary:'
	bl	printf

	mov	r0, #0		@ begin stack tear down and return
	sub	sp, fp, #4
	pop	{fp, pc}
	
/* main program */
	.text
	.align	2
	.global	main
main:
	push	{fp, lr}	@ setup stack frame
	add 	fp, sp, #4
	@sub	sp, sp, #8	@ 0 arg

	ldr	r0, get_line_promptP
	bl	puts
	ldr	r0, buffP	@ call get_line(buffP)
	mov	r1, #100
	bl	get_line

	ldr	r0, buffP	@ call get_trans(buffP)
	bl	get_trans

	ldr	r0, get_line_promptP
	bl	puts
	ldr	r0, buff2P	@ call get_line(buff2P)
	mov	r1, #100
	bl	get_line

	ldr	r0, buff2P	@ call translate(buff2P)
	bl	translate

	bl	print_summary	@ call print_summary
	
	ldr	r0, buff2P	@ print resulting buff2
	bl 	printf
	
	mov	r0, #0
	sub	sp, fp, #4	@ tear down stack frame and return
	pop	{fp, pc}

/* pointer variables for format strings */
	
	.align	2
buffP:		.word	buff
buff2P:		.word	buff2
get_line_promptP: .word get_line_prompt
successP:	.word	success
summaryP:	.word	summary
	
/* string constants */
	
	.section	.rodata
	.align 	2

get_line_prompt:	@ format string for printf
	.asciz	"Enter a line of input (2 characters separated by a space):"
success:		@ format string for printf
	.asciz	"Success!\n"
summary:
	.asciz	"Summary:\n"

	.data		@ .data allows for changing characters
	.align	2
buff:	.skip	100
buff2:	.skip	100
