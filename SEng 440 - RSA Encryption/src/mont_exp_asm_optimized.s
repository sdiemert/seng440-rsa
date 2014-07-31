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
	@ args = 8, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	add	fp, sp, #28
	sub	sp, sp, #64
	str	r0, [fp, #-76]      @store address of the arguments in memory
	str	r1, [fp, #-72]
	str	r2, [fp, #-84]
	str	r3, [fp, #-80]
	mov	r3, #0              @set t=0 and store
	str	r3, [fp, #-68]
	mov	r5, #0              @set count=0 and store 
	ldmib	fp, {r3-r4}     @load m into r3/r4, r3=0 r4=3233
	b	.L6                 @NOTE: this is the only branch to L6
.L7:                        @first while loop body
	add	r5, r5, #1          @count++
	movs	r4, r4, lsr #1  @shift temp >> 1
	mov	r3, r3, rrx         @assists with ship operation
.L6:                                           
	orr	r3, r3, r4          @combine the two registers together for comparision
	cmp	r3, #0              @compare values
	bne	.L7                 @if not equal to zero, move to main loop body. 
	str	r5, [fp, #-48]      @store i = count into memory
	mov	r3, #1              @store check_bit = 1
	str	r3, [fp, #-40]      
	ldr	r3, [fp, #-84]      @load y from memory we only need the ldb's
	and	r3, r3, #1          @y_mod = y & 1
	str	r3, [fp, #-36]      @store y_mod
	b	.L8                 @NOTE: this is the only call to L8
.L10:                   @THIS SECTION DOES x_check = ((x&check_bit) != 0)
	ldr	r6, [fp, #-40]      @load check_bit -> r6
	mov	r2, r6, asr #31     @shift check_bit down
	sub	r4, fp, #76         @load address of x into r4
	ldmia	r4, {r3-r4}     @load x into r3/r4, r3 has MSBs
	and	r1, r6, r3          @check_bit & x
	and	r2, r2, r4
	mov	r6, #0              @set x_check = 0, DONT CHANGE ME           
	str	r6, [fp, #-32]
	orr	r1, r1, r2
	cmp	r1, #0              @if x*check_bit == 0, x_check remains 0
	beq	.L9                 @move to L9 to continue with x_check as 0
	mov	r6, #1              @otherwise, set x_check = 1
	str	r6, [fp, #-32]
.L9:                   @THIS SECTION DOES n=... and t=...
	ldr	r7, [fp, #-68]      @load t -> r7
	and	r1, r7, #1          @ t & 1 -> r1
	ldr	r3, [fp, #-36]      @ y_mod -> r3
	mul	r3, r6, r3          @ y_mod * x_check -> r3
	add	r3, r1, r3          @ (y_mod * x_check) + (t & 1) -> r3
	str	r3, [fp, #-44]      @store r3 into variable n
	mov	r8, r7, asr #31     @t>>31 -> r8
	mov	r4, r3, asr #31     @shift value of r3 by 31 and put result into r4
	ldr	r2, [fp, #4]        @load m -> r2
	mul	r1, r4, r2          @m*n -> r1
	ldr	r2, [fp, #8]        @load y -> r2
	mul	r2, r3, r2          
	add	r1, r1, r2          
	ldr	r2, [fp, #4]
	umull	r5, r6, r2, r3  @multiply n*m
	add	r6, r1, r6
	ldr	r3, [fp, #-32]      @load x_check -> r3
	mov	r4, r3, asr #31
	ldr	r2, [fp, #-84]      @load y -> r2
	mul	r1, r4, r2          @x_check * y -> r1
	ldr	r2, [fp, #-80]      @load msbs of y->r2
	mul	r2, r3, r2          @x_check * y -> r2
	add	r1, r1, r2          @combine r1 + r2 -> r1 (the result of y *x_check)
	ldr	r2, [fp, #-84]      @load y -> r2
	umull	r9, sl, r2, r3  
	add	r1, r1, sl 
	adds	r3, r9, r5
	adc	r4, r1, r6
	adds	r3, r3, r7
	adc	r4, r4, r8
	movs	r4, r4, lsr #1
	mov	r3, r3, rrx
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-48]
	sub	r3, r3, #1
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #1
	str	r3, [fp, #-40]
.L8:                        @the part of montgomery multp routine
	ldr	r5, [fp, #-48]      @load i into r5
	cmp	r5, #0              @check i != 0
	bne	.L10                @move to L10 if i != 0 
	ldr	r6, [fp, #-68]      @load t -> r3
	mov	r2, r6, asr #31     @put reuslt of t >> 31 into r2 
	str	r2, [fp, #-88]      @store t >> 31 -> -88
	ldr	r3, [fp, #8]        @load m->r3
	cmp	r3, r2              @if m > t, move to L11 
	bhi	.L11
	cmp	r3, r2              @if t >> 31 != m, move to L14
	bne	.L14
	ldr	r3, [fp, #4]        @load m -> r3
	cmp	r3, r6              @compare t and m
	bhi	.L11                @if k
.L14:
	ldr	r3, [fp, #-68]      @load t -> r3
	ldr	r2, [fp, #4]        @load ldbs of m       
	rsb	r3, r2, r3          @ reverse subtract (r3 - r2) t = t-m
	str	r3, [fp, #-68]      @store value of t -> -68 
.L11:
	ldr	r0, [fp, #-68]      @load t->r3
	mov	r1, r0, asr #31     @shift t >> 31 -> r4
	sub	sp, fp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
	.size	montgomery_multiplication, .-montgomery_multiplication
	.global	__aeabi_uldivmod
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d\000"
	.align	2
.LC1:
	.ascii	"%lld\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #92
	str	r0, [fp, #-80]
	str	r1, [fp, #-84]
	mov	r3, #123
	mov	r4, #0
	str	r3, [fp, #-76]
	str	r4, [fp, #-72]
	mov	r3, #3232
	add	r3, r3, #1
	mov	r4, #0
	str	r3, [fp, #-68]
	str	r4, [fp, #-64]
	mov	r3, #17
	mov	r4, #0
	str	r3, [fp, #-60]
	str	r4, [fp, #-56]
	ldr	r3, [fp, #-68]
	mov	r0, r3
	bl	count_num_bits
	mov	r3, r0
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	mov	r2, r3, asl #1
	mov	r3, #1
	mov	r3, r3, asl r2
	mov	r4, r3, asr #31
	mov	r0, r3
	mov	r1, r4
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	bl	__aeabi_uldivmod
	mov	r4, r3
	mov	r3, r2
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	sub	r4, fp, #68
	ldmia	r4, {r3-r4}
	stmia	sp, {r3-r4}
	mov	r0, #1
	mov	r1, #0
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	bl	montgomery_multiplication
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	sub	r4, fp, #68
	ldmia	r4, {r3-r4}
	stmia	sp, {r3-r4}
	sub	r1, fp, #76
	ldmia	r1, {r0-r1}
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	bl	montgomery_multiplication
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r2, #1
	ldr	r3, [fp, #-48]
	mov	r3, r2, asl r3
	str	r3, [fp, #-48]
	mov	r3, #1
	str	r3, [fp, #-16]
	b	.L16
.L18:
	ldr	r3, [fp, #-16]
	mov	r1, r3
	mov	r2, r1, asr #31
	sub	r4, fp, #60
	ldmia	r4, {r3-r4}
	and	r1, r1, r3
	and	r2, r2, r4
	mov	r3, r1
	orr	r3, r3, r2
	cmp	r3, #0
	beq	.L17
	sub	r4, fp, #68
	ldmia	r4, {r3-r4}
	stmia	sp, {r3-r4}
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	bl	montgomery_multiplication
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
.L17:
	sub	r4, fp, #68
	ldmia	r4, {r3-r4}
	stmia	sp, {r3-r4}
	sub	r1, fp, #28
	ldmia	r1, {r0-r1}
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	bl	montgomery_multiplication
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	str	r3, [fp, #-16]
.L16:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	blt	.L18
	sub	r4, fp, #68
	ldmia	r4, {r3-r4}
	stmia	sp, {r3-r4}
	mov	r0, #1
	mov	r1, #0
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	bl	montgomery_multiplication
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	ldr	r0, .L20
	mov	r1, #8
	bl	printf
	ldr	r0, .L20+4
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	bl	printf
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LC0
	.word	.LC1
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
