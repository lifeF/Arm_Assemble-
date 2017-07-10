@ ARM Assembly - Exercise 2
@ Find the total of values of arrayA

	.text 	@ instruction memory
	.global main
	
main:
	
	sub sp, sp, #4
	str lr, [sp, #0]

	@ load values
	ldr r0, =array_a
	mov r5,#0
	mov r3,#0 
	
	@ Write YOUR CODE HERE
	@ Total = arrayA[0]+arrayA[1]+arrayA[2]+arrayA[3]+arrayA[4]+arrayA[5]
	@ Store the result in r5
	mov r6,#16
	mov r4,#0
	@ ---------------------
		
		
			ldr r7,[r0,r4]
			ldr r8,[r0,r6]
			CMP r7,r8
			BEQ next
			B print2

		next   :  add r6,r6,#-4
			 add r4,r4,#4
			 ldr r7,[r0,r4]
			 ldr r8,[r0,r6]
			 CMP r7,r8
			 BEQ print1
			 B print2

		




	@ ---------------------
	
	
print1:@ load aguments and print
		ldr r0, =format
		
		bl printf
		B exit

print2:@ load aguments and print
		ldr r0, =format1
		
		bl printf


exit:@ stack handling (pop lr from the stack) and return
	 ldr lr, [sp, #0]
	 add sp, sp, #4
	 mov pc, lr
	
	.data	@ data memory
	
format : .asciz "This number is a palindrome\n"
format1: .asciz "This number is not a palindrome\n"
	
	@array called array_a of size 40 bytes
	.balign 4 			@align to an address of multiple of 4
array_a: .word 1,1,1,1,1
