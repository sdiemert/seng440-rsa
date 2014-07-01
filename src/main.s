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
	.file	"main.c"
	.text
	.align	2
	.global	compute_powers_of_two
	.type	compute_powers_of_two, %function
compute_powers_of_two:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L2
.L4:
	mov	r2, #1
	ldr	r3, [fp, #-16]
	mov	r3, r2, asl r3
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	and	r3, r2, r3
	cmp	r3, #0
	beq	.L3
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-32]
	add	r2, r3, r2
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L3:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	blt	.L4
	ldr	r3, [fp, #-12]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	compute_powers_of_two, .-compute_powers_of_two
	.align	2
	.global	ipow
	.type	ipow, %function
ipow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L7
.L9:
	ldr	r3, [fp, #-20]
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L8
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	mul	r3, r2, r3
	str	r3, [fp, #-8]
.L8:
	ldr	r3, [fp, #-20]
	mov	r3, r3, asr #1
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-16]
	mul	r3, r2, r3
	str	r3, [fp, #-16]
.L7:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L9
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	ipow, .-ipow
	.global	__aeabi_idivmod
	.align	2
	.global	compute_lookup_table
	.type	compute_lookup_table, %function
compute_lookup_table:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #4]
	add	r4, r3, r2
	ldr	r3, [fp, #-24]
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [r4, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L12
.L13:
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #4]
	add	r4, r3, r2
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #1
	mov	r3, r3, asl #2
	rsb	r2, r3, #0
	ldr	r3, [fp, #4]
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #2
	bl	ipow
	mov	r3, r0
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [r4, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #1
	str	r3, [fp, #-20]
.L12:
	ldr	r3, [fp, #-36]
	rsb	r3, r3, #1
	mov	r3, r3, asl #2
	rsb	r2, r3, #0
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	mov	r3, #1
	mov	r2, r3, asl r2
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L13
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
	.size	compute_lookup_table, .-compute_lookup_table
	.align	2
	.global	compute_modulus_from_look_up_table
	.type	compute_modulus_from_look_up_table, %function
compute_modulus_from_look_up_table:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-8]
	mov	r3, #1
	str	r3, [fp, #-12]
	b	.L16
.L17:
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mul	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L16:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L17
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	compute_modulus_from_look_up_table, .-compute_modulus_from_look_up_table
	.align	2
	.global	modular_exp
	.type	modular_exp, %function
modular_exp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	ldr	r1, [fp, #-24]
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-16]
	b	.L20
.L22:
	ldr	r2, [fp, #-20]
	mov	r3, r2, asr #31
	mov	r1, r3, lsr #31
	add	r3, r2, r1
	and	r3, r3, #1
	rsb	r3, r1, r3
	cmp	r3, #1
	bne	.L21
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	mul	r3, r2, r3
	mov	r0, r3
	ldr	r1, [fp, #-24]
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-8]
.L21:
	ldr	r3, [fp, #-20]
	mov	r3, r3, asr #1
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-16]
	mul	r3, r2, r3
	mov	r0, r3
	ldr	r1, [fp, #-24]
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-16]
.L20:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bgt	.L22
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	modular_exp, .-modular_exp
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Modular Exp Result: %d\012\000"
	.align	2
.LC1:
	.ascii	"Table Result : %d\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 552
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #560
	str	r0, [fp, #-552]
	str	r1, [fp, #-556]
	mov	r3, #2752
	add	r3, r3, #1
	str	r3, [fp, #-32]
	mov	r3, #852
	add	r3, r3, #3
	str	r3, [fp, #-28]
	mov	r3, #3232
	add	r3, r3, #1
	str	r3, [fp, #-24]
	sub	r3, fp, #288
	ldr	r0, [fp, #-32]
	mov	r1, #32
	mov	r2, r3
	bl	compute_powers_of_two
	mov	r3, r0
	str	r3, [fp, #-20]
	sub	r2, fp, #288
	sub	r3, fp, #544
	str	r3, [sp, #0]
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	compute_lookup_table
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-32]
	ldr	r2, [fp, #-24]
	bl	modular_exp
	mov	r3, r0
	str	r3, [fp, #-12]
	sub	r3, fp, #544
	sub	r2, fp, #288
	mov	r0, r3
	ldr	r1, [fp, #-20]
	ldr	r3, [fp, #-24]
	bl	compute_modulus_from_look_up_table
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r0, .L26
	ldr	r1, [fp, #-12]
	bl	printf
	ldr	r0, .L26+4
	ldr	r1, [fp, #-8]
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	.LC0
	.word	.LC1
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
