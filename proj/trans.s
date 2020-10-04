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
	
	ldr	r0, [fp, #-8]	@ moving inchar into r4 using get_byte
	mov	r1, #0
	bl	get_byte
	mov	r4, r0

	ldr	r0, [fp, #-8]	@ check if format is correct ('\n')
	mov	r1, #3
	bl	get_byte
	mov	r1, #10
	cmp	r0, r1
	bne	error
	
	ldr	r0,[fp, #-8]	@ moving outchar into r5 using get_byte
	mov	r1, #2
	bl	get_byte
	mov	r5, r0
	
	mov	r0, #1		@ return 1 if correct
	sub	sp, fp, #4	@ tear down stack frame and return
	pop	{fp, pc}

error:
	mov	r0, #0		@ return 0 if an error in formatting
	sub	sp, fp, #4
	pop	{fp, pc}

/* function translate
	1 arg - a non-const and non-empty string
	state change - replace all chars that match the inchar with the outchar
	return - replaced string */
	.text
	.align 2
translate:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ 1 arg, 1 local variable
	@ [fp, #-8] holds a non-const, non-empty string
	@ [fp, #-12] holds an iterable int i (doubles as num_examined)
	@ i will be moved into r6 as charct
	@ a comparison to #' ' will be made to increment wordct (r7)
	@ a comparison to #'\n' will be made to increment linect (r8)
	str	r0, [fp, #-8]

	mov	r0, #0		@ inititialize i = 0
	str	r0, [fp, #-12]
	b	loop		@ start loop


loop:
	ldr	r1, [fp, #-12] 	@ use i with get_byte to get current char
	ldr	r0, [fp, #-8]
	bl	get_byte
	
	mov	r1, r4
	cmp	r0, r1		@ if that character matches inchar
	bne	else

	ldr	r0, [fp, #-8]	@ load buffP into r0
	ldr	r1, [fp, #-12]
	mov	r2, r5		@ call put_byte(buffP, i, outchar)
	bl	put_byte
	
	ldr	r0, [fp, #-12]	@ i++
	add	r0, r0, #1
	str	r0, [fp, #-12]
	b	loop		@ loop again
	
else:
	ldr	r1, [fp, #-12] 	@ else use i with get_byte to get current char
	ldr	r0, [fp, #-8]
	bl	get_byte
	mov	r1, #10
	cmp	r0, r1		@ is current char a newline?
	beq	exit		@ if yes, exit the loop
	
	ldr	r0, [fp, #-12]	@ else, i++
	add	r0, r0, #1
	str	r0, [fp, #-12]
	
	ldr	r1, [fp, #-12] 	@ use i with get_byte to get current char
	sub	r1, r1, #1
	ldr	r0, [fp, #-8]
	bl	get_byte
	
	mov	r1, #' '
	cmp	r0, r1		@ if that character is a space
	beq	checks		@ do a series of checks before wordct++
	b	loop		@ else, go back to loop

checks:				@ is this the first char?
	ldr	r1, [fp, #-12] 	@ compare i to 0
	sub	r1, r1, #1
	mov	r0,  #0
	cmp	r0, r1		@ if so, just continue loop
	beq	loop
	
	ldr	r1, [fp, #-12] 	@ is the character behind this one a space?
	sub	r1, r1, #2
	ldr	r0, [fp, #-8]	@ call get_byte(buffP, i-2)
	bl	get_byte
	mov	r1,  #' '
	cmp	r0, r1		@ else, if two spaces in a row
	beq	loop		@ go back to loop

	mov	r0, r7		@ else, increment wordct
	add	r0, r0, #1
	mov	r7, r0
	b	loop		@ go back to loop
	
exit:
	mov	r0, r8		@ increment linect
	add	r0, r0, #1
	mov	r8, r0

	mov	r0, r7		@ increment wordcount
	add	r0, r0, #1
	mov	r7, r0
	
	ldr	r0, [fp, #-12]	@ add current nchars characters into total r6
	mov	r1, r6
	add	r1, r1, r0
	mov	r6, r1
	
	ldr	r0, [fp, #-8]	@ load the address of buffP
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
	mov	r1, r6
	mov	r2, r7
	mov	r3, r8
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
	sub	sp, sp, #8	@ 1 local variable
	@ [fp, #-8] holds iterable int i, also doubling as linect

	mov	r6, #0		@ initialize global variables to 0
	mov	r7, #0
	mov	r8, #0
	
	ldr	r0, get_trans_promptP
	bl	puts
	ldr	r0, transP	@ call get_line(transP)
	mov	r1, #100
	bl	get_line

	ldr	r0, transP	@ call get_trans(transP)
	bl	get_trans

	ldr	r0, get_line_promptP
	bl	puts

	mov	r0, #0
	str	r0, [fp, #-8]	@ initialize i = 0
	b	body
	
body:	
	ldr	r0, buffP	@ call get_line(buffP)
	mov	r1, #100
	bl	get_line

	ldr	r0, buffP	@ call get_byte(buffP, 0)
	mov	r1, #0
	bl	get_byte
	mov	r1, #10
	cmp	r0, r1		@ if the first char is '\n'
	beq	stop		@ exit the loop

	ldr	r0, buffP	@ else, call translate(buffP)
	bl	translate
	
	ldr	r0, buffP	@ print resulting buff
	bl 	printf
	b	body		@ loop again

stop:	
	bl	print_summary	@ call print_summary
	
	mov	r0, #0
	sub	sp, fp, #4	@ tear down stack frame and return
	pop	{fp, pc}

/* pointer variables for format strings */
	
	.align	2
transP:		.word	trans
buffP:		.word	buff
get_trans_promptP:	.word get_trans_prompt
get_line_promptP:	.word	get_line_prompt
summaryP:	.word	summary
	
/* string constants */
	
	.section	.rodata
	.align 	2

get_trans_prompt:	@ format string for printf
	.asciz	"Enter a line of input (2 characters separated by a space):"
	.align 2
get_line_prompt:	@ format string for printf
	.asciz	"Enter a full line of input:"
	.align 2
summary:		@ format string for printf
	.asciz	"Summary:\n%d characters\n%d words\n%d lines\n"
	.align 2
	
	.data		@ .data allows for changing characters
	.align	2
trans:	.skip	100
buff:	.skip	100
