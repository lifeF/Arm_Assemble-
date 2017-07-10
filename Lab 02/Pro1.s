@ ARM Assembly - exercise 5

	.text 	@ instruction memory
	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	@ load values
	mov r0, #0 @i is stored here
	mov r1, #0 @j is stored here
	mov r6, #0 @j is stored here

	
	@ Write YOUR CODE HERE
	
	@ j=0;
	@ for (i=0;i<10;i++)
	@ 		print (“This value is %d \n”, i)
	
	@ Put final j to r5

	@ ---------------------
loop:	
	cmp r6,#10
	BLO inc
	BHS  exit

	
inc:  	add r6,r6,#1
	mov r5,r6	
      	B print
      


	@ ---------------------
	
print:	
	@ load aguments and print
	ldr r0, =format
	mov r1, r5
	bl printf
	B loop

exit:
	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory

format: .asciz "This value is %d\n"

