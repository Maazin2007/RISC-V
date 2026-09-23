.globl main

#--------------------------
# main()
#---------------------------
main:
	# main calls other function so we need to store the ra in the stack
	addi sp, sp, -16
	sw ra, 12(sp)
	
	# create the function parameters
	li a0, 10
	li a1, 5
	li a2, 5
	
	jal ra, compute
	
	li a7, 1
	ecall
	
	# resotoration of the stack 
	lw ra, 12(sp)
	addi sp, sp, 16
	jalr zero, 0(ra)
	
	
	
	
#---------------------
# computer (a, b, c)
# takes a - a0, b - a1, c - a2
# returns (a + b) - sub_pair(b, c)
#--------------------------
compute:
	# compute calls subpair
	addi sp, sp, -16
	sw ra, 12(sp)
	sw s0, 8(sp)
	
	add s0, a0, a1
	mv a0, a1
	mv a1, a2
	jal ra, sub_pair
	sub s0, s0, a0
	mv a0, s0
	# restoration if the stack
	lw ra, 12(sp)
	lw s0, 8(sp)
	addi sp, sp, 16
	jalr zero, 0(ra)
	
# leaf function does no call any other functions
sub_pair:
	sub a0, a0, a1
	jalr zero, 0(ra)
	
	
	