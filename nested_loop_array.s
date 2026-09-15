.text 
.globl main

main: 
     # load the test values
     li x5, 2  # a = 2
     li x6, 3  # b = 3
     li x10, 0x10010000 # Base address of D
	
     # outerloop counter
     li x7, 0

outer_loop:
     # bge
     bge x7, x5, outer_exit
     li x29, 0
     
inner_loop:
     # check the inner condition
     bge x29, x6, inner_exit
     add t0, x7, x29
     slli t1, x29, 4
     add t2, x10, t1
     sw t0, 0(t2)
     
     addi x29, x29, 1
     jal zero, inner_loop
     
inner_exit:
     addi x7, x7, 1
     jal zero, outer_loop
  
outer_exit:
     li a7, 10
     ecall
  
  
  
  
  