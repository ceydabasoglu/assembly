.data
message: .asciiz "Sum is: "
.text
.globl main

main:
	add $t1, $t1, $0 # sum=0
	addi $t2, $0, 7 # a=7
	addi $t3, $0, 15 # b=15
	jal addfunction
	
	
addfunction:
	sle $t4, $t2, $t3 # if a <= b , t4=1. if not t4=0
	beq $t4, $0, end  # if a is not <= b, exit the loop.
	add $t1, $t1, $t2 # sum=sum+a
	addi $t2,$t2,1 # a = a+1
	jr $ra
			
end:
	addi $v0, $0, 4 # print message
	la $a0, message
	syscall
	
	addi $v0, $0, 1 
	add $a0, $t1, $0
	syscall
  #CEYDA BA�O�LU 
