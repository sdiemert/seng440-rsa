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
	.file	"mont_exp.c"
	.text
	.align	2
	.global	montgomery_multiplication
	.type	montgomery_multiplication, %function
montgomery_multiplication:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, fp}
	add	fp, sp, #12
	sub	sp, sp, #128
	str	r0, [fp, #-52]
	str	r1, [fp, #-48]
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
	mov	r3, #0
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-40]
	mov	r3, #1
	str	r3, [fp, #-32]
	ldmib	fp, {r3-r4}
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L2
.L3:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	sub	r4, fp, #28
	ldmia	r4, {r3-r4}
	movs	r4, r4, asr #1
	mov	r3, r3, rrx
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
.L2:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bgt	.L3
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L12
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L3
	ldr	r3, [fp, #-28]
	cmp	r3, #0
.L12:
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L5
.L8:
	ldr	r3, [fp, #-44]
	and	r3, r3, #1
	str	r3, [fp, #-136]
	ldr	r3, [fp, #-32]
	mov	r1, r3
	mov	r2, r1, asr #31
	sub	r4, fp, #52
	ldmia	r4, {r3-r4}
	and	r5, r1, r3
	and	r6, r2, r4
	str	r5, [fp, #-132]
	str	r6, [fp, #-128]
	ldr	r3, [fp, #-32]
	mov	r0, r3
	mov	r1, r0, asr #31
	str	r0, [fp, #-124]
	str	r1, [fp, #-120]
	mov	r1, #0
	mov	r2, #0
	str	r1, [fp, #-116]
	str	r2, [fp, #-112]
	ldr	r2, [fp, #-132]
	ldr	r3, [fp, #-124]
	cmp	r2, r3
	bne	.L6
	ldr	r4, [fp, #-128]
	ldr	r5, [fp, #-120]
	cmp	r4, r5
	bne	.L6
	mov	r0, #1
	mov	r1, #0
	str	r0, [fp, #-116]
	str	r1, [fp, #-112]
.L6:
	sub	r2, fp, #60
	ldmia	r2, {r1-r2}
	mov	r3, #1
	mov	r4, #0
	and	r3, r3, r1
	and	r4, r4, r2
	ldr	r2, [fp, #-112]
	mul	r2, r3, r2
	ldr	r1, [fp, #-116]
	mul	r1, r4, r1
	add	r2, r2, r1
	ldr	ip, [fp, #-116]
	umull	r5, r6, ip, r3
	mov	r3, r5
	mov	r4, r6
	add	r2, r2, r4
	mov	r4, r2
	ldr	r0, [fp, #-136]
	add	r3, r0, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-44]
	mov	r1, r3
	mov	r2, r1, asr #31
	str	r1, [fp, #-108]
	str	r2, [fp, #-104]
	ldr	r3, [fp, #-36]
	mov	r4, r3, asr #31
	ldr	r2, [fp, #4]
	mul	r1, r4, r2
	ldr	r2, [fp, #8]
	mul	r2, r3, r2
	add	r1, r1, r2
	ldr	r2, [fp, #4]
	umull	r5, r6, r2, r3
	str	r5, [fp, #-100]
	str	r6, [fp, #-96]
	ldr	r6, [fp, #-96]
	add	r1, r1, r6
	str	r1, [fp, #-96]
	ldr	r3, [fp, #-32]
	mov	r1, r3
	mov	r2, r1, asr #31
	sub	r4, fp, #52
	ldmia	r4, {r3-r4}
	and	r5, r1, r3
	and	r6, r2, r4
	str	r5, [fp, #-92]
	str	r6, [fp, #-88]
	ldr	r3, [fp, #-32]
	mov	r0, r3
	mov	r1, r0, asr #31
	str	r0, [fp, #-84]
	str	r1, [fp, #-80]
	mov	r1, #0
	mov	r2, #0
	str	r1, [fp, #-76]
	str	r2, [fp, #-72]
	ldr	r2, [fp, #-92]
	ldr	r3, [fp, #-84]
	cmp	r2, r3
	bne	.L7
	ldr	r4, [fp, #-88]
	ldr	r5, [fp, #-80]
	cmp	r4, r5
	bne	.L7
	mov	r0, #1
	mov	r1, #0
	str	r0, [fp, #-76]
	str	r1, [fp, #-72]
.L7:
	ldr	r3, [fp, #-60]
	ldr	r2, [fp, #-72]
	mul	r2, r3, r2
	ldr	r3, [fp, #-56]
	ldr	r1, [fp, #-76]
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r3, [fp, #-60]
	ldr	ip, [fp, #-76]
	umull	r5, r6, r3, ip
	mov	r3, r5
	mov	r4, r6
	add	r2, r2, r4
	mov	r4, r2
	sub	r1, fp, #100
	ldmia	r1, {r0-r1}
	adds	r3, r3, r0
	adc	r4, r4, r1
	sub	r2, fp, #108
	ldmia	r2, {r1-r2}
	adds	r3, r3, r1
	adc	r4, r4, r2
	movs	r4, r4, asr #1
	mov	r3, r3, rrx
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-32]
	mov	r3, r3, asl #1
	str	r3, [fp, #-32]
.L5:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L8
	ldr	r3, [fp, #-44]
	mov	r4, r3
	mov	r5, r4, asr #31
	str	r4, [fp, #-68]
	str	r5, [fp, #-64]
	ldr	r3, [fp, #8]
	ldr	r5, [fp, #-64]
	cmp	r3, r5
	bgt	.L9
	ldr	r3, [fp, #8]
	ldr	r6, [fp, #-64]
	cmp	r3, r6
	bne	.L13
	ldr	r3, [fp, #4]
	ldr	ip, [fp, #-68]
	cmp	r3, ip
	bhi	.L9
	ldr	r3, [fp, #4]
	ldr	r0, [fp, #-68]
	cmp	r3, r0
.L13:
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #4]
	rsb	r3, r2, r3
	str	r3, [fp, #-44]
.L9:
	ldr	r3, [fp, #-44]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, r6, fp}
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
	stmfd	sp!, {r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #60
	str	r0, [fp, #-56]
	str	r1, [fp, #-60]
	mov	r3, #123
	str	r3, [fp, #-52]
	mov	r3, #3232
	add	r3, r3, #1
	str	r3, [fp, #-48]
	mov	r3, #17
	str	r3, [fp, #-44]
	ldr	r0, [fp, #-48]
	bl	count_num_bits
	mov	r3, r0
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	mov	r2, r3, asl #1
	mov	r3, #1
	mov	r3, r3, asl r2
	mov	r0, r3
	ldr	r1, [fp, #-48]
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	mov	r5, r3
	mov	r6, r5, asr #31
	ldr	r3, [fp, #-48]
	mov	r4, r3, asr #31
	stmia	sp, {r3-r4}
	mov	r0, #1
	mov	r1, #0
	mov	r2, r5
	mov	r3, r6
	bl	montgomery_multiplication
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-52]
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [fp, #-36]
	mov	r5, r3
	mov	r6, r5, asr #31
	ldr	r3, [fp, #-48]
	mov	r4, r3, asr #31
	stmia	sp, {r3-r4}
	mov	r0, r1
	mov	r1, r2
	mov	r2, r5
	mov	r3, r6
	bl	montgomery_multiplication
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L15
.L17:
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-24]
	mov	r3, r2, asr r3
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L16
	ldr	r3, [fp, #-32]
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [fp, #-28]
	mov	r5, r3
	mov	r6, r5, asr #31
	ldr	r3, [fp, #-48]
	mov	r4, r3, asr #31
	stmia	sp, {r3-r4}
	mov	r0, r1
	mov	r1, r2
	mov	r2, r5
	mov	r3, r6
	bl	montgomery_multiplication
	mov	r3, r0
	str	r3, [fp, #-32]
.L16:
	ldr	r3, [fp, #-28]
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [fp, #-28]
	mov	r5, r3
	mov	r6, r5, asr #31
	ldr	r3, [fp, #-48]
	mov	r4, r3, asr #31
	stmia	sp, {r3-r4}
	mov	r0, r1
	mov	r1, r2
	mov	r2, r5
	mov	r3, r6
	bl	montgomery_multiplication
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L15:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	blt	.L17
	ldr	r3, [fp, #-32]
	mov	r5, r3
	mov	r6, r5, asr #31
	ldr	r3, [fp, #-48]
	mov	r4, r3, asr #31
	stmia	sp, {r3-r4}
	mov	r0, #1
	mov	r1, #0
	mov	r2, r5
	mov	r3, r6
	bl	montgomery_multiplication
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r0, .L19
	ldr	r1, [fp, #-32]
	bl	printf
	sub	sp, fp, #16
	ldmfd	sp!, {r4, r5, r6, fp, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LC0
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
