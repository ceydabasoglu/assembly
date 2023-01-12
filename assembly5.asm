.data
arr: .word 7,-4,5,0,8,-2,1,-3
msg: .asciiz "sum of positive numbers in array: "

.text
.globl main
main:
	addi $t0, $0, 0 # i
	addi $t1, $0, 0 # sum
	ori $t2, $0, 8 # constant 8
	la $t3, arr  # load address of array into t3
	
	loop:
	slt $t4, $t0, $t2  # compare t0 and t2. 
	beq $t4, $0, end  # if i is not < 8, exit the loop
	lw $t4,0($t3)
	bgt $0,$t4,if   #if array[i] > 0 
	add $t1, $t1, $t4  # sum+=t4
	if :
	add $t0, $t0, 1 # i++
	add $t3, $t3, 4 
	j loop 
	
	end:
	
	addi $v0, $0, 4 # Now print out result
	la $a0, msg
	syscall
	
	addi $v0, $0, 1 # sum (in t1)
	add $a0, $t1, $0
	syscall
	jr $ra
	
	#ceyda baþoðlu 
	
