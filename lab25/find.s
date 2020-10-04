
/* main program */
	.text
	.align	2
	.global	main
main:
	push	{fp, lr}	@ setup stack frame
	add 	fp, sp, #4
	sub	sp, sp, #16	@ 4 local variables
	@ [fp, #-8] holds ch, a character
	@ [fp, #-12] holds i, an int
	@ [fp, #-16] hold the most recent character from get_byte
	
	ldr	r0, get_line_promptP
	bl	puts
	ldr	r0, buffP	@ call get_line(buffP)
	mov	r1, #100
	bl	get_line

	ldr	r0, get_char_promptP 	@ get character prompt
	bl	printf
	ldr	r0, get_char_scanP	@ call scanf
	sub	r1, fp, #8
	bl	__isoc99_scanf

	mov	r0, #0		@ initialize i = 0
	str	r0, [fp, #-12]
	@ no need to compare, go straight to body
	b	body
	
body:	
	ldr	r0, buffP	@ call get_byte(buffP, i)
	ldr	r1, [fp, #-12]
	bl	get_byte
	str	r0, [fp, #-16]

	ldr	r0, [fp, #-16]	@ most recent char from get_byte
	mov	r1, #0		@ if that byte == '\0'
	cmp	r0, r1
	beq	stop		@ stop

	ldr	r1, [fp, #-12]	@ otherwise, i++
	add	r1, r1, #1
	str	r1, [fp, #-12]

	ldr	r0, [fp, #-16]	@ if that character == ch
	ldr	r1, [fp, #-8]
	cmp	r0, r1
	bne	body		
	
	ldr	r0, partial_resultP	@ print partial result
	ldr	r1, [fp, #-12]
	bl	printf
	b	body		@ loop back to body

stop:
	ldr	r0, finish_resultP	@ add a null byte
	bl	printf
	mov	r0, #0
	sub	sp, fp, #4	@ tear down stack frame and return
	pop	{fp, pc}

/* pointer variables for format strings */
	
	.align	2
buffP:		.word	buff
get_line_promptP: .word get_line_prompt
get_char_promptP: .word	get_char_prompt
get_char_scanP:	.word	get_char_scan
partial_resultP: .word	partial_result
finish_resultP:	.word	finish_result
	
/* string constants */
	
	.section	.rodata
	.align 	2

get_char_prompt:	@ format string for printf
	.asciz	"Enter a character: "
	.align 2
get_char_scan:		@ format string for scanf
	.asciz	"%c"
	.align 2
get_line_prompt:	@ format string for printf
	.asciz	"Enter a line of input:"
	.align 2
partial_result:		@ format string for printf
	.ascii 	"%d "
	.align 2
finish_result:		@ format string for printf
	.asciz	"\n"

	
	.data		@ .data allows for changing characters
	.align	2
buff:	.skip	100
