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
	# Save main's ra
	addi sp, sp, -16
	sw   ra, 12(sp)

	li   a0, 5
	jal  ra, factorial

	# Print the result (120)
	li   a7, 1
	ecall

	# Exit cleanly
	lw   ra, 12(sp)
	addi sp, sp, 16
	li   a7, 10           # ecall 10 = standard program exit
	ecall
factorial:
	# create a stack to store the ra
	addi sp, sp, -16
	sw ra, 12(sp)
	sw a0, 8(sp)
	# we need to move the a0 if we are calling another function
	li t0, 1
	ble a0, t0, base_case
	
	addi a0, a0, -1
	jal ra, factorial
	
	lw t1, 8(sp)
	mul a0, t1, a0
	lw ra, 12(sp)
	addi sp, sp, 16
	jalr zero, 0(ra)
	
	
# leaf function
base_case:
	li a0, 1
	lw ra, 12(sp)
	addi sp, sp, 16
	jalr zero, 0(ra)