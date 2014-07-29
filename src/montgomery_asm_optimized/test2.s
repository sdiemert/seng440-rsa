	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"mont_exp_optimized_2.c"
	.text
	.align	2
	.global	count_num_bits
	.type	count_num_bits, %function
count_num_bits:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	movle	r3, #0
	ble	.L3
	mov	r3, #0
.L4:
	movs	r0, r0, asr #1
	add	r3, r3, #1
	bne	.L4
.L3:
	mov	r0, r3
	bx	lr
	.size	count_num_bits, .-count_num_bits
	.align	2
	.global	montgomery_multiplication
	.type	montgomery_multiplication, %function
montgomery_multiplication:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	sub	sp, sp, #32
	ldr	r6, [sp, #68]
	ldr	fp, [sp, #64]
	orrs	r5, fp, r6
	str	r6, [sp, #4]
	str	r0, [sp, #16]
	str	r1, [sp, #20]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	beq	.L10
	mov	r1, fp
	mov	r2, r6
	mov	r0, #0
.L11:
	movs	r2, r2, lsr #1
	mov	r1, r1, rrx
	orrs	r3, r1, r2
	add	r0, r0, #1
	bne	.L11
	ldr	r7, [sp, #12]
	and	r7, r7, #1
	str	r7, [sp, #28]
	mov	r9, r0
	mov	r5, r3
	mov	sl, #1
.L13:
	add	r7, sp, #16
	ldmia	r7, {r6-r7}
	mov	r1, sl
	mov	r2, r1, asr #31
	and	r3, r1, r6
	and	r4, r2, r7
	orrs	r7, r3, r4
	ldr	r7, [sp, #28]
	moveq	r1, #0
	movne	r1, #1
	and	r3, r5, #1
	mla	r7, r1, r7, r3
	ldr	ip, [sp, #12]
	ldr	r0, [sp, #4]
	mov	r8, r7, asr #31
	mov	r2, r1, asr #31
	umull	r3, r4, r1, ip
	mul	r0, r7, r0
	ldr	r6, [sp, #8]
	mla	ip, fp, r8, r0
	mla	r4, r6, r1, r4
	umull	r1, r2, r7, fp
	mov	r6, r5, asr #31
	adds	r3, r3, r5
	adc	r4, r4, r6
	add	r2, ip, r2
	adds	r3, r3, r1
	adc	r4, r4, r2
	movs	r2, r4, lsr #1
	mov	r1, r3, rrx
	subs	r9, r9, #1
	mov	sl, sl, asl #1
	mov	r5, r1
	bne	.L13
	ldr	r7, [sp, #4]
	mov	r9, r1
	mov	sl, r9, asr #31
	cmp	r7, sl
	mov	r3, r1
	bls	.L19
.L14:
	mov	r4, r3, asr #31
	mov	r1, r4
	mov	r0, r3
	add	sp, sp, #32
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
.L19:
	beq	.L20
.L10:
	rsb	r3, fp, r5
	b	.L14
.L20:
	cmp	fp, r9
	bhi	.L14
	b	.L10
	.size	montgomery_multiplication, .-montgomery_multiplication
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r2, #860
	sub	sp, sp, #36
	mov	r3, #0
	add	r2, r2, #3
	str	r2, [sp, #8]
	str	r3, [sp, #12]
	mov	r3, #2688
	mov	r4, #0
	mov	r0, #3232
	mov	r1, #4080
	add	r3, r3, #5
	add	r0, r0, #1
	add	r1, r1, #15
	str	r3, [sp, #16]
	str	r4, [sp, #20]
	mov	r4, #1
	str	r0, [sp, #4]
	str	r1, [sp, #0]
	str	r4, [sp, #28]
.L28:
	ldr	r5, [sp, #28]
	mov	r6, #0
	mov	r1, r5
	mov	r2, r1, asr #31
	mov	r5, #17
	and	r3, r1, r5
	and	r4, r2, r6
	orrs	r6, r3, r4
	ldreq	r0, [sp, #16]
	andeq	fp, r0, #1
	moveq	r5, r0
	bne	.L40
.L22:
	mov	r3, fp
	mov	r4, r3, asr #31
	umull	r1, r2, r3, r5
	ldr	r6, [sp, #20]
	mul	r0, fp, fp
	mla	r2, r3, r6, r2
	add	r8, sp, #16
	ldmia	r8, {r7-r8}
	ldr	r3, [sp, #4]
	movs	r8, r8, lsr #1
	mov	r7, r7, rrx
	and	r7, r7, #1
	smlal	r1, r2, r3, r0
	mov	r9, r7
	mov	sl, r9, asr #31
	mov	r4, r5
	umull	r5, r6, r9, r4
	ldr	r0, [sp, #20]
	movs	r4, r2, lsr #1
	mov	r3, r1, rrx
	mla	r6, r9, r0, r6
	and	r0, r3, #1
	mla	lr, fp, r7, r0
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [sp, #16]
	adds	r1, r1, r5
	ldr	r4, [sp, #4]
	adc	r2, r2, r6
	mov	ip, r3, lsr #2
	smlal	r1, r2, r4, lr
	and	ip, ip, #1
	mov	r7, ip
	mov	r8, r7, asr #31
	umull	r5, r6, r7, r3
	movs	r4, r2, lsr #1
	mov	r3, r1, rrx
	ldr	r1, [sp, #20]
	and	r0, r3, #1
	mla	r6, r7, r1, r6
	mla	lr, fp, ip, r0
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [sp, #16]
	adds	r1, r1, r5
	ldr	r4, [sp, #4]
	adc	r2, r2, r6
	mov	ip, r3, lsr #3
	smlal	r1, r2, r4, lr
	and	ip, ip, #1
	mov	r7, ip
	mov	r8, r7, asr #31
	umull	r5, r6, r7, r3
	movs	r4, r2, lsr #1
	mov	r3, r1, rrx
	ldr	r1, [sp, #20]
	and	r0, r3, #1
	mla	r6, r7, r1, r6
	mla	lr, fp, ip, r0
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [sp, #16]
	adds	r1, r1, r5
	ldr	r4, [sp, #4]
	adc	r2, r2, r6
	mov	ip, r3, lsr #4
	smlal	r1, r2, r4, lr
	and	ip, ip, #1
	mov	r7, ip
	mov	r8, r7, asr #31
	umull	r5, r6, r7, r3
	movs	r4, r2, lsr #1
	mov	r3, r1, rrx
	ldr	r1, [sp, #20]
	and	r0, r3, #1
	mla	r6, r7, r1, r6
	mla	lr, fp, ip, r0
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [sp, #16]
	adds	r1, r1, r5
	ldr	r4, [sp, #4]
	adc	r2, r2, r6
	mov	ip, r3, lsr #5
	smlal	r1, r2, r4, lr
	and	ip, ip, #1
	mov	r7, ip
	mov	r8, r7, asr #31
	umull	r5, r6, r7, r3
	movs	r4, r2, lsr #1
	mov	r3, r1, rrx
	ldr	r1, [sp, #20]
	and	r0, r3, #1
	mla	r6, r7, r1, r6
	mla	lr, fp, ip, r0
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [sp, #16]
	adds	r1, r1, r5
	ldr	r4, [sp, #4]
	adc	r2, r2, r6
	mov	ip, r3, lsr #6
	smlal	r1, r2, r4, lr
	and	ip, ip, #1
	mov	r7, ip
	mov	r8, r7, asr #31
	umull	r5, r6, r7, r3
	movs	r4, r2, lsr #1
	mov	r3, r1, rrx
	ldr	r1, [sp, #20]
	and	r0, r3, #1
	mla	r6, r7, r1, r6
	mla	lr, fp, ip, r0
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [sp, #16]
	adds	r1, r1, r5
	ldr	r4, [sp, #4]
	adc	r2, r2, r6
	mov	ip, r3, lsr #7
	smlal	r1, r2, r4, lr
	and	ip, ip, #1
	mov	r7, ip
	mov	r8, r7, asr #31
	umull	r5, r6, r7, r3
	movs	r4, r2, lsr #1
	mov	r3, r1, rrx
	ldr	r1, [sp, #20]
	and	r0, r3, #1
	mla	r6, r7, r1, r6
	mla	lr, fp, ip, r0
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [sp, #16]
	adds	r1, r1, r5
	ldr	r4, [sp, #4]
	adc	r2, r2, r6
	mov	ip, r3, lsr #8
	smlal	r1, r2, r4, lr
	and	ip, ip, #1
	mov	r7, ip
	mov	r8, r7, asr #31
	umull	r5, r6, r7, r3
	movs	r4, r2, lsr #1
	mov	r3, r1, rrx
	ldr	r1, [sp, #20]
	and	r0, r3, #1
	mla	r6, r7, r1, r6
	mla	lr, fp, ip, r0
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [sp, #16]
	adds	r1, r1, r5
	ldr	r4, [sp, #4]
	adc	r2, r2, r6
	mov	ip, r3, lsr #9
	smlal	r1, r2, r4, lr
	and	ip, ip, #1
	mov	r7, ip
	mov	r8, r7, asr #31
	umull	r5, r6, r7, r3
	movs	r4, r2, lsr #1
	mov	r3, r1, rrx
	ldr	r1, [sp, #20]
	and	r0, r3, #1
	mla	r6, r7, r1, r6
	mla	lr, fp, ip, r0
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [sp, #16]
	adds	r1, r1, r5
	ldr	r4, [sp, #4]
	adc	r2, r2, r6
	mov	r0, r3, lsr #10
	smlal	r1, r2, r4, lr
	and	r0, r0, #1
	mov	r5, r0
	mov	r6, r5, asr #31
	umull	r7, r8, r5, r3
	movs	r4, r2, lsr #1
	mov	r3, r1, rrx
	ldr	r4, [sp, #20]
	and	r2, r3, #1
	mla	r8, r5, r4, r8
	mla	r1, fp, r0, r2
	mov	r5, r3
	mov	r6, r5, asr #31
	ldr	r0, [sp, #16]
	adds	r5, r5, r7
	ldr	r2, [sp, #4]
	adc	r6, r6, r8
	mov	ip, r0, lsr #11
	smlal	r5, r6, r2, r1
	and	ip, ip, #1
	mov	r3, ip
	mov	r4, r3, asr #31
	umull	r7, r8, r3, r0
	movs	r2, r6, lsr #1
	mov	r1, r5, rrx
	ldr	r2, [sp, #20]
	and	r0, r1, #1
	mla	r8, r3, r2, r8
	mla	lr, fp, ip, r0
	mov	r3, r1
	mov	r4, r3, asr #31
	adds	r3, r3, r7
	ldr	r5, [sp, #4]
	adc	r4, r4, r8
	smlal	r3, r4, r5, lr
	movs	r2, r4, lsr #1
	mov	r1, r3, rrx
	mov	r3, r1
	mov	r0, r1
	mov	r1, r0, asr #31
	cmp	r1, #0
	bne	.L25
	cmp	r0, #3232
	bls	.L39
.L25:
	sub	r3, r3, #3232
	sub	r3, r3, #1
	mov	r0, r3
	mov	r1, r0, asr #31
.L39:
	str	r0, [sp, #16]
	str	r1, [sp, #20]
	ldr	r1, [sp, #28]
	ldr	r2, [sp, #0]
	mov	r1, r1, asl #1
	cmp	r1, r2
	str	r1, [sp, #28]
	ble	.L28
	ldr	r3, [sp, #8]
	add	r5, sp, #8
	ldmia	r5, {r4-r5}
	mov	ip, #3232
	add	ip, ip, #1
	and	r2, r3, #1
	smlal	r4, r5, ip, r2
	str	r4, [sp, #8]
	str	r5, [sp, #12]
	mov	r3, r4
	mov	r4, r5
	movs	r4, r4, lsr #1
	mov	r3, r3, rrx
	mov	r5, r3
	mov	r6, r5, asr #31
	and	r3, r3, #1
	smlal	r5, r6, ip, r3
	movs	r2, r6, lsr #1
	mov	r1, r5, rrx
	and	r0, r1, #1
	mov	r3, r1
	mov	r4, r3, asr #31
	smlal	r3, r4, ip, r0
	movs	r2, r4, lsr #1
	mov	r1, r3, rrx
	and	r0, r1, #1
	mov	r3, r1
	mov	r4, r3, asr #31
	smlal	r3, r4, ip, r0
	movs	r2, r4, lsr #1
	mov	r1, r3, rrx
	and	r0, r1, #1
	mov	r3, r1
	mov	r4, r3, asr #31
	smlal	r3, r4, ip, r0
	movs	r2, r4, lsr #1
	mov	r1, r3, rrx
	and	r0, r1, #1
	mov	r3, r1
	mov	r4, r3, asr #31
	smlal	r3, r4, ip, r0
	movs	r2, r4, lsr #1
	mov	r1, r3, rrx
	and	r0, r1, #1
	mov	r3, r1
	mov	r4, r3, asr #31
	smlal	r3, r4, ip, r0
	movs	r2, r4, lsr #1
	mov	r1, r3, rrx
	and	r0, r1, #1
	mov	r3, r1
	mov	r4, r3, asr #31
	smlal	r3, r4, ip, r0
	movs	r2, r4, lsr #1
	mov	r1, r3, rrx
	and	r0, r1, #1
	mov	r3, r1
	mov	r4, r3, asr #31
	smlal	r3, r4, ip, r0
	movs	r2, r4, lsr #1
	mov	r1, r3, rrx
	and	r0, r1, #1
	mov	r3, r1
	mov	r4, r3, asr #31
	smlal	r3, r4, ip, r0
	movs	r2, r4, lsr #1
	mov	r1, r3, rrx
	and	r0, r1, #1
	mov	r3, r1
	mov	r4, r3, asr #31
	smlal	r3, r4, ip, r0
	movs	r2, r4, lsr #1
	mov	r1, r3, rrx
	and	r0, r1, #1
	mov	r3, r1
	mov	r4, r3, asr #31
	smlal	r3, r4, ip, r0
	movs	r2, r4, lsr #1
	mov	r1, r3, rrx
	mov	r2, r1
	mov	r3, r2, asr #31
	cmp	r3, #0
	beq	.L41
.L29:
	sub	r3, r1, #3232
	sub	r3, r3, #1
	mov	r4, r3
	mov	r5, r4, asr #31
.L31:
	mov	r1, #8
	ldr	r0, .L43
	bl	printf
	mov	r2, r4
	mov	r3, r5
	ldr	r0, .L43+4
	bl	printf
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L40:
	ldr	r1, [sp, #8]
	ldr	r5, [sp, #16]
	and	ip, r1, #1
	mov	r3, ip
	mov	r4, r3, asr #31
	umull	r1, r2, r3, r5
	ldr	r0, [sp, #20]
	and	fp, r5, #1
	mla	r2, r3, r0, r2
	mul	r0, fp, ip
	add	r8, sp, #8
	ldmia	r8, {r7-r8}
	ldr	r3, [sp, #4]
	movs	r8, r8, lsr #1
	mov	r7, r7, rrx
	and	r7, r7, #1
	smlal	r1, r2, r3, r0
	mov	r9, r7
	mov	sl, r9, asr #31
	mov	r4, r5
	umull	r5, r6, r9, r4
	ldr	r0, [sp, #20]
	movs	r4, r2, lsr #1
	mov	r3, r1, rrx
	mla	r6, r9, r0, r6
	and	r0, r3, #1
	mla	lr, fp, r7, r0
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [sp, #8]
	adds	r1, r1, r5
	ldr	r4, [sp, #4]
	adc	r2, r2, r6
	mov	ip, r3, lsr #2
	smlal	r1, r2, r4, lr
	and	ip, ip, #1
	ldr	r0, [sp, #16]
	mov	r7, ip
	mov	r8, r7, asr #31
	umull	r5, r6, r7, r0
	movs	r4, r2, lsr #1
	mov	r3, r1, rrx
	ldr	r1, [sp, #20]
	and	r0, r3, #1
	mla	r6, r7, r1, r6
	mla	lr, fp, ip, r0
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [sp, #8]
	adds	r1, r1, r5
	ldr	r4, [sp, #4]
	adc	r2, r2, r6
	mov	ip, r3, lsr #3
	smlal	r1, r2, r4, lr
	and	ip, ip, #1
	ldr	r0, [sp, #16]
	mov	r7, ip
	mov	r8, r7, asr #31
	umull	r5, r6, r7, r0
	movs	r4, r2, lsr #1
	mov	r3, r1, rrx
	ldr	r1, [sp, #20]
	and	r0, r3, #1
	mla	r6, r7, r1, r6
	mla	lr, fp, ip, r0
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [sp, #8]
	adds	r1, r1, r5
	ldr	r4, [sp, #4]
	adc	r2, r2, r6
	mov	ip, r3, lsr #4
	smlal	r1, r2, r4, lr
	and	ip, ip, #1
	ldr	r0, [sp, #16]
	mov	r7, ip
	mov	r8, r7, asr #31
	umull	r5, r6, r7, r0
	movs	r4, r2, lsr #1
	mov	r3, r1, rrx
	ldr	r1, [sp, #20]
	and	r0, r3, #1
	mla	r6, r7, r1, r6
	mla	lr, fp, ip, r0
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [sp, #8]
	adds	r1, r1, r5
	ldr	r4, [sp, #4]
	adc	r2, r2, r6
	mov	ip, r3, lsr #5
	smlal	r1, r2, r4, lr
	and	ip, ip, #1
	ldr	r0, [sp, #16]
	mov	r7, ip
	mov	r8, r7, asr #31
	umull	r5, r6, r7, r0
	movs	r4, r2, lsr #1
	mov	r3, r1, rrx
	ldr	r1, [sp, #20]
	and	r0, r3, #1
	mla	r6, r7, r1, r6
	mla	lr, fp, ip, r0
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [sp, #8]
	adds	r1, r1, r5
	ldr	r4, [sp, #4]
	adc	r2, r2, r6
	mov	ip, r3, lsr #6
	smlal	r1, r2, r4, lr
	and	ip, ip, #1
	ldr	r0, [sp, #16]
	mov	r7, ip
	mov	r8, r7, asr #31
	umull	r5, r6, r7, r0
	movs	r4, r2, lsr #1
	mov	r3, r1, rrx
	ldr	r1, [sp, #20]
	and	r0, r3, #1
	mla	r6, r7, r1, r6
	mla	lr, fp, ip, r0
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [sp, #8]
	adds	r1, r1, r5
	ldr	r4, [sp, #4]
	adc	r2, r2, r6
	mov	ip, r3, lsr #7
	smlal	r1, r2, r4, lr
	and	ip, ip, #1
	ldr	r0, [sp, #16]
	mov	r7, ip
	mov	r8, r7, asr #31
	umull	r5, r6, r7, r0
	movs	r4, r2, lsr #1
	mov	r3, r1, rrx
	ldr	r1, [sp, #20]
	and	r0, r3, #1
	mla	r6, r7, r1, r6
	mla	lr, fp, ip, r0
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [sp, #8]
	adds	r1, r1, r5
	ldr	r4, [sp, #4]
	adc	r2, r2, r6
	mov	ip, r3, lsr #8
	smlal	r1, r2, r4, lr
	and	ip, ip, #1
	ldr	r0, [sp, #16]
	mov	r7, ip
	mov	r8, r7, asr #31
	umull	r5, r6, r7, r0
	movs	r4, r2, lsr #1
	mov	r3, r1, rrx
	ldr	r1, [sp, #20]
	and	r0, r3, #1
	mla	r6, r7, r1, r6
	mla	lr, fp, ip, r0
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [sp, #8]
	adds	r1, r1, r5
	ldr	r4, [sp, #4]
	adc	r2, r2, r6
	mov	ip, r3, lsr #9
	smlal	r1, r2, r4, lr
	and	ip, ip, #1
	ldr	r0, [sp, #16]
	mov	r7, ip
	mov	r8, r7, asr #31
	umull	r5, r6, r7, r0
	movs	r4, r2, lsr #1
	mov	r3, r1, rrx
	ldr	r1, [sp, #20]
	and	r0, r3, #1
	mla	r6, r7, r1, r6
	mla	lr, fp, ip, r0
	mov	r1, r3
	mov	r2, r1, asr #31
	ldr	r3, [sp, #8]
	adds	r1, r1, r5
	ldr	r4, [sp, #4]
	adc	r2, r2, r6
	mov	r0, r3, lsr #10
	smlal	r1, r2, r4, lr
	and	r0, r0, #1
	ldr	r3, [sp, #16]
	mov	r5, r0
	mov	r6, r5, asr #31
	umull	r7, r8, r5, r3
	movs	r4, r2, lsr #1
	mov	r3, r1, rrx
	ldr	r4, [sp, #20]
	and	r2, r3, #1
	mla	r8, r5, r4, r8
	mla	r1, fp, r0, r2
	mov	r5, r3
	mov	r6, r5, asr #31
	ldr	r0, [sp, #8]
	adds	r5, r5, r7
	ldr	r2, [sp, #4]
	adc	r6, r6, r8
	mov	ip, r0, lsr #11
	smlal	r5, r6, r2, r1
	and	ip, ip, #1
	ldr	r0, [sp, #16]
	mov	r3, ip
	mov	r4, r3, asr #31
	umull	r7, r8, r3, r0
	movs	r2, r6, lsr #1
	mov	r1, r5, rrx
	ldr	r2, [sp, #20]
	and	r0, r1, #1
	mla	r8, r3, r2, r8
	mla	lr, fp, ip, r0
	mov	r3, r1
	mov	r4, r3, asr #31
	adds	r3, r3, r7
	ldr	r5, [sp, #4]
	adc	r4, r4, r8
	smlal	r3, r4, r5, lr
	movs	r2, r4, lsr #1
	mov	r1, r3, rrx
	mov	r2, r1
	mov	r3, r2, asr #31
	cmp	r3, #0
	bne	.L23
	cmp	r2, #3232
	bls	.L42
.L23:
	sub	r3, r1, #3232
	sub	r3, r3, #1
	mov	r0, r3
	mov	r1, r0, asr #31
	str	r0, [sp, #8]
	str	r1, [sp, #12]
	ldr	r5, [sp, #16]
	b	.L22
.L41:
	cmp	r2, #3232
	movls	r4, r2
	movls	r5, r3
	bls	.L31
	b	.L29
.L42:
	str	r2, [sp, #8]
	str	r3, [sp, #12]
	ldr	r5, [sp, #16]
	b	.L22
.L44:
	.align	2
.L43:
	.word	.LC0
	.word	.LC1
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%d\012\000"
.LC1:
	.ascii	"%lld\012\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
