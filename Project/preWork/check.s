@ ARM Assembly example for using scanf("%d") and printf("%d")
@ Try this with characters (%c)

	.text	@ instruction memory
	
	.global main

main:
	@ stack handling
	@ push (store) lr to the stack
	sub	sp, sp, #4
	str	lr, [sp, #0]

readDims:
	@allocate stack for input
	sub	sp, sp, #4

	@scanf to get an integer
	ldr	r0, =formats
	mov	r1, sp	
	bl	scanf	@scanf("%d",sp)
	@r2 holds the number of rows
	ldr	r2, [sp, #0]
	@allocate stack for input
	sub	sp, sp, #4

	@scanf to get an integer
	ldr	r0, =formats
	mov	r1, sp	
	bl	scanf	@scanf("%d",sp)
	@r3 holds the number of columns
	ldr	r3, [sp, #0]
	mul r5,r3,r2
	mov r4,r5

loopScan:
	cmp r4,#0
	bge loopOut
	sub r4,r4,#1
	ldr	r0, =formatWish	
	bl 	printf
	b loopScan

loopOut:

	@copy from stack to register
	ldr	r1, [sp,#0]

	@release stack
	add	sp, sp, #4

	@format for printf
	ldr	r0, =formatp
	bl 	printf

	@copy from stack to register
	ldr	r1, [sp,#0]

	@release stack
	add	sp, sp, #4

	@format for printf
	ldr	r0, =formatp
	bl 	printf


	
    @ stack handling (pop lr from the stack) and return
	ldr	lr, [sp, #0]
	add	sp, sp, #4
	mov	pc, lr		
	
	
	.data	@ data memory
formats: .asciz "%d"
formatp: .asciz "The number is %d\n"
formatCheck: .asciz " check "
formatWish: .asciz " wish "

