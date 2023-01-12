.data
message:  .asciiz "Sum is: "
.text

main:   addi $a0,$0,0 # sum = 0
	li $a1,7 # a => a1=7
	li $a2,15 # b => a2=15
	jal addfunction
	move $a1,$v0
	addi $v0,$0,4 
	la $a0,message 
	syscall
	addi $v0,$0,1
	move $a0,$a1
	syscall
		
	
 end:   
	addi $v0,$0,10
	syscall	



addfunction:
	subi $sp,$sp,16 # space on stack
	sw $a0,0($sp) # save sum 
	sw $a1,4($sp) #save a
	sw $a2,8($sp) #save b
	sw $ra,12($sp) #save ret addr
	 	 
	bne $a1,$a2,else
	move $v0, $a1
	j returnSum
else:	
	addi $a1,$a1,1 #a++
	jal addfunction
	lw $a1,4($sp)
	add $a0,$a1,$v0 #sum= a + addfunction()
	move $v0,$a0 #return sum
	

returnSum:	
		
	lw $a0,0($sp) # restore sum 
	lw $a1,4($sp) #restore a
	lw $a2,8($sp) #restore b
	lw $ra,12($sp) #restore ret addr 	
	addi $sp,$sp,16 # bring back stack pointer
	jr $ra
#CEYDA BAÞOÐLU 
	 
