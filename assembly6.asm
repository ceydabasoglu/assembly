#CEYDA BAÞOÐLU 
.data
array1: .word 5, -1, 4, -3, 0
array2: .word 0, 0, 0, 0, 0
.text
.globl main


main:
	li $t1, 0 # i=0
	li $t2,5 # t2 is size of array1
	la $t3, array1 
	la $t4, array2 
	
	loop1:
	ble $t2,$t1,print 
	lw $a0, 0($t3) # load current array element into a0
	jal reverse # call reverse function
	
	sw $v0, 0($t4) # store inverse of the array1[i] into array2[i]
	add $t1, $t1, 1 # i++
	add $t3, $t3, 4 # increment current array1 element pointer		
	add $t4, $t4, 4 # increment current array2 element pointer		
	j loop1
	
	print:
	li $t1,0 #i=0 
	li $t2,5 # t2 is size of array2
	la $t4, array2 # load address of array2 into t4
	
	loop2:
	ble $t2,$t1,end	
	
	addi $v0,$0, 1 
	lw $a0, 0($t4) # load current array element into a0
	syscall # print num
	
	addi $a0,$0,32  #print space between numbers  
	addi $v0,$0,11  
	syscall
	
	add $t1, $t1, 1 # i++
	add $t4, $t4, 4 # increment current array2 element pointer		
	j loop2
	
	end:		
	addi $v0,$0,10 
	syscall	


reverse:
	mul $a0, $a0, -1 #invert
	add $v0,$a0,$zero #return inverse number
	jr $ra
