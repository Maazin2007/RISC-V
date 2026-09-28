.globl main

#int fact(int n) {
#	if (n <= 1) {
#		return 1;
#	}
#	
#	return n * fact(n - 1)
#}
# assume you get the n in a0
main:
	addi, sp, sp, -4
	sw ra, 0(sp)
	
	li a0, 5
	jal ra, fact
	
	lw ra, 0(sp)
	addi sp, sp, 4
	li a7, 1
	ecall
	
	# smart to use a7 = 10 ecall is much better approach then using ret because in some programs ra is default to zero which cmenas tthere is no code there so jal gives an error
	li a7, 10
	ecall
fact:
	# store our ra and a0
	addi sp, sp, -8
	sw ra, 0(sp)
	sw a0, 4(sp)
	
	# check if the a0 is less than equal to 1
	li t0, 1
	ble a0, t0, basecase # a0 going to store the result of the recustion 
	addi a0, a0, -1
	jal ra, fact
	
	lw t1, 4(sp) # store the n
	lw ra, 0(sp)
	# free the space
	addi sp, sp, 8
	mul a0, t1, a0
	ret
	
	
basecase:
	li a0, 1
	addi sp, sp, 8
	ret