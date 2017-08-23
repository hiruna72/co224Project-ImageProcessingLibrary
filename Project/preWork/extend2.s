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
	mov r2,sp
	@allocate stack for input
	sub	sp, sp, #4

	@scanf to get an integer
	ldr	r0, =formats
	mov	r1, sp	
	bl	scanf	@scanf("%d",sp)
	@r3 holds the number of columns
	mov r3,sp
	
iterators:
	@iterator r4 for rows
	mov r4,#0
	@iterator r5 for columns
	mov r5,#0

loopRowScan:
	cmp r4,r2
	beq loopOut
	add r4,r4,#1
loopColScan:
	cmp r5,r3
	beq loopRowScan
	add r5,r5,#1

	@allocate stack for input
	sub	sp, sp, #4

	@scanf to get an integer
	ldr	r0, =formats
	mov	r1, sp	
	bl	scanf	@scanf("%d",sp)

	b loopColScan


loopOut:
	mov r4,#0
	mov r5,#0

loopRowPrint:
	cmp r4,r2
	beq loopOut2
	add r4,r4,#1
loopColPrint:
	cmp r5,r3
	beq loopRowPrint
	add r5,r5,#1

	@copy from stack to register
	ldr	r1, [sp,#0]

	@release stack
	add	sp, sp, #4

	@format for printf
	ldr	r0, =formatp
	bl 	printf

	b loopColPrint


loopOut2:
	
    @ stack handling (pop lr from the stack) and return
	ldr	lr, [sp, #0]
	add	sp, sp, #4
	mov	pc, lr		
	
	
	.data	@ data memory
formats: .asciz "%d"
formatp: .asciz "The number is %d\n"
