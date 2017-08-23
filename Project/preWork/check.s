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
	@r4 holds the number of rows
	ldr	r1, [sp,#0]
	mov r4,r1

	@allocate stack for input
	sub	sp, sp, #4

	@scanf to get an integer
	ldr	r0, =formats
	mov	r1, sp	
	bl	scanf	@scanf("%d",sp)
	@r5 holds the number of columns
	ldr	r1, [sp, #0]
	mov r5,r1


	@allocate stack for input
	sub	sp, sp, #4

	@scanf to get an integer
	ldr	r0, =formats
	mov	r1, sp	
	bl	scanf	@scanf("%d",sp)
	@r6 holds the opCode
	ldr	r1, [sp, #0]
	mov r6,r1
	mul r7,r4,r5

printTotal:
	mov r1,r7	
	ldr	r0, =formatopCode
	bl 	printf

	mov r8,#0

loop:
	
	cmp r7,r8
	beq loopOut
	bal print
mid:
	add r8,r8,#1
	bal loop	
print:
	ldr	r0, =formatWish	
	bl printf
	bal mid


loopOut:

	@copy from stack to register
	ldr	r1, [sp,#0]
	
	@release stack
	add	sp, sp, #4

	@format for printf
	ldr	r0, =formatopCode
	bl 	printf

	@copy from stack to register
	ldr	r1, [sp,#0]
	
	@release stack
	add	sp, sp, #4

	@format for printf
	ldr	r0, =formatCol
	bl 	printf


	@copy from stack to register
	ldr	r1, [sp,#0]

	@release stack
	add	sp, sp, #4

	@format for printf
	ldr	r0, =formatRow
	bl 	printf


	
    @ stack handling (pop lr from the stack) and return
	ldr	lr, [sp, #0]
	add	sp, sp, #4
	mov	pc, lr		
	
	
	.data	@ data memory
formats: .asciz "%d"
formatp: .asciz "The number is %d\n"
formatRow: .asciz "The numberOfRows is %d\n"
formatCol: .asciz "The numberOfCols is %d\n"
formatopCode: .asciz "The opCode is %d\n"
formatCheck: .asciz " check "
formatWish: .asciz " wish "

