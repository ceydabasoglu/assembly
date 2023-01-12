
# CEYDA BAÞOÐLU 
.data
array1: .word 5, -1, 4, -6, 0, 8, -3, 7
array2: .word 0,0,0,0,0

.text
.globl main


main:
	li $t1, 0 # i=0 t0
	li $t2,8 # t2 is size of array1
	la $t3, array1 #t2
	la $t4, array2 
	
	loop:
	ble $t2,$t1,end
	lw $a0, 0($t3) # load current array element into a0
	jal posNum # call reverse function
	
	sw $v0, 0($t4) # store inverse of the array1[i] into array2[i]
	add $t1, $t1, 1 # i++
	add $t3, $t3, 4 # increment current array1 element pointer		
	add $t4, $t4, 4 # increment current array2 element pointer
	li $v0,1
	lw $a1,0($t4)
	syscall 
	li $a0, 32  #printing space between numbers
	li $v0, 11
	syscall		
	j loop
	
posNum:

	slt $t5,$0,$t3
	beq $t5,$0,end
	move $v0,$t5
	jr $ra


end:		
	addi $v0,$0,10 
	syscall	
	


