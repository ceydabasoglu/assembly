.data

arr: .word 8, 1, 4, 5, 6, 3, 2, 9, 7, 0		
mes: .asciiz "Bubble Sort :  "			

.text
.globl main
main:
	la $s1, arr				 #load address of numbers into $s1

	li $s2, 0					#initialize counter 1 for loop 1
	li $s3, 9 					#n - 1
	
	li $s0, 0 					#initialize counter 2 for loop 2

	li $t3, 0					#initialize counter for printing
	li $t4, 10

	li $v0, 4,					#print message
	la $a0, mes
	syscall

loop:
	sll $t6, $s0, 2					
	add $t6, $s1, $t6				#add the address of numbers to t6

	lw $t0, 0($t6)  				#load numbers[j]	
	lw $t1, 4($t6) 					#load numbers[j+1]

	slt $t2, $t0, $t1				#if t0 < t1
	bne $t2, $0, inc

	sw $t1, 0($t6) 					#swap
	sw $t0, 4($t6)

inc:	

	addi $s0, $s0, 1				#increase t1
	sub $s4, $s3, $s2				#subtract s2 from s3

	bne  $s0, $s4, loop				#if s0 does not equal 9, loop
	addi $s2, $s2, 1 				#otherwise add 1 to s0
	li $s0, 0 					#reset s0 to 0

	bne  $s2, $s3, loop				# s7++
	
print:
	beq $t3, $t4, end				#if t3 = t4 final
	
	lw $t5, 0($s1)					#load from numbers
	
	li $v0, 1					#print the number
	move $a0, $t5
	syscall
	
	addi $s1, $s1, 4				#increase through the numbers
	addi $t3, $t3, 1				#increase counter

	j print

end:	
	li $v0, 10					#finish
	syscall
	
	#ceyda baþoðlu 
