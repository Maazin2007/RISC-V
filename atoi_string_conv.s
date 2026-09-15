.data
	test_str: .string "-24"   # holding the test string to test

.text 
.globl main

main:
	# load the adress onto x10
	la x10, test_str
	mv t0, x10 # strores the current counter
	
	
	# we need are going to implement a recursive solution 
	li s1, 0 # t1 stores the final sum
	li s2, 0 # the flag if the first bit is - or +
	
	lb t1, 0(t0)
	li t2, 45
	bne t1, t2, check_plus # if it not negsitve chexc for +
	addi t0, t0, 1
	li s2, 1
	jal zero loop
	
check_plus:
	li t2, 43
	bne t1, t2, loop
	addi t0, t0, 1
	
	
loop:
	# load the current bit into a register
	lb t1, 0(t0)
	# break condition when the x10 contains 0x0000 null terminator
	beq t1, zero, loop_exit
	# convert the bit into a integer
	addi t1, t1, -48 # convert to its integer form
	# 10x = 8x + 2x
	slli t2, s1, 3
	slli t3, s1, 1
	add t2, t2, t3
	
	add s1, t1, t2	
	# incremen the memory address
	addi t0, t0, 1
	# repeat the loop
	jal zero, loop
	
loop_exit:
	# Exit
	beq  s2, zero, Exit # skip the handle negative
	
handle_neg:
	sub s1, zero, s1
	
Exit: 
	mv a0, s1
	li a7, 1
	ecall # print the content in a0
	
	li a7, 10
	ecall # exit the program