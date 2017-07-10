@ ARM Assembly - sample program 

	.text 	@ instruction memory
	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	@ load values --> can be changed
	mov r0, #7
	mov r1, #8
	mov r2, #7
	mov r3, #-8

	
	@ Write YOUR CODE HERE
	@ ---------------------
	
	CMP r1,r2
	
	BHS printthis
	B printthis2 
	

	

	
	
	@ ---------------------
printthis:
	@ load aguments and print
	ldr r0, =format
	mov r1, r5
	bl printf 
	B exit


printthis2:
	@ load aguments and print
	ldr r0, =format2
	mov r1, r5
	bl printf
	
	




exit:@ stack handling (pop lr from the stack) and return
	 ldr lr, [sp, #0]
	 add sp, sp, #4
	 mov pc, lr

	.data	@ data memory
format: .asciz "I is larger than j\n"
format2: .asciz "I is smaler than j \n"

