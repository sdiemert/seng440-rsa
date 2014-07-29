	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"mont_exp_optimized.c"
	.text
	.align	2
	.global	count_num_bits
	.type	count_num_bits, %function
count_num_bits:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asr #1
	str	r3, [fp, #-16]
.L2:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bgt	.L3
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	count_num_bits, .-count_num_bits
	.align	2
	.global	montgomery_multiplication
	.type	montgomery_multiplication, %function
montgomery_multiplication:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r0, [fp, #-40]
	bl	count_num_bits
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-36]
	and	r3, r3, #1
	str	r3, [fp, #-12]
	b	.L6
.L7:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-16]
	and	r3, r2, r3
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-28]
	and	r1, r3, #1
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	mul	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-36]
	mul	r1, r3, r2
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-40]
	mul	r3, r2, r3
	add	r2, r1, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	mov	r3, r3, asr #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	str	r3, [fp, #-16]
.L6:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L7
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	blt	.L8
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-40]
	rsb	r3, r2, r3
	str	r3, [fp, #-28]
.L8:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	montgomery_multiplication, .-montgomery_multiplication
	.global	__aeabi_idivmod
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #48
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	mov	r3, #123
	str	r3, [fp, #-36]
	mov	r3, #3232
	add	r3, r3, #1
	str	r3, [fp, #-32]
	mov	r3, #17
	str	r3, [fp, #-28]
	ldr	r0, [fp, #-32]
	bl	count_num_bits
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #1
	mov	r3, #1
	mov	r3, r3, asl r2
	mov	r0, r3
	ldr	r1, [fp, #-32]
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-32]
	bl	montgomery_multiplication
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-36]
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-32]
	bl	montgomery_multiplication
	mov	r3, r0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r2, #1
	ldr	r3, [fp, #-24]
	mov	r3, r2, asl r3
	str	r3, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L11
.L13:
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-8]
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L12
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r2, [fp, #-32]
	bl	montgomery_multiplication
	mov	r3, r0
	str	r3, [fp, #-16]
.L12:
	ldr	r0, [fp, #-12]
	ldr	r1, [fp, #-12]
	ldr	r2, [fp, #-32]
	bl	montgomery_multiplication
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #1
	str	r3, [fp, #-8]
.L11:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	blt	.L13
	mov	r0, #1
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-32]
	bl	montgomery_multiplication
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r0, .L15
	ldr	r1, [fp, #-16]
	bl	printf
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	.LC0
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
