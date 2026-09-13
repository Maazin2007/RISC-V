.text 
.globl main # decleares main as the global entry point 

main: 
	# load test value
	li x5, 0
	li x6, 0xffffffffffffffff
	
	
	# extracting the bits from 16 down to 11 from the x5
	slli t0, x5, 15
	srli t0, t0, 26
	slli t0, t0, 26 # adjust with the destination spot
	
	slli t1, x6, 6
	srli t1, t1, 6
	
	or x6, t1, t0 # final solution 
	
	# print x6
	mv a0, x6
	li a7, 34
	ecall
	
	# System call code to exit
	li a7, 10 # 10 is the system code to exit the program
	ecall # executes the system call