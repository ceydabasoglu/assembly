.data 
A: .word 1,2,3,4,5,6,7,8,9
.text
.globl main
main :
	la $s0, A # starting address of A in $s0
	li $s1, 9 # number of elements in $s1
	li $s2, 1 # i in $s2
	li $s3, 0 # max in $s3
	li $s4, -1 # index in $s4
Loop: 
	sll $t1, $s2, 2 # $t1 = i * 4;
	add $t1, $t1, $s0 # $t1 = i * 4 + $s0
	lw  $t0, 0($t1) # $t0 = A[i]
	slt $t2, $t0, $s3 # $t2 = 1 if $t0 < $s3. $t2 = 0 if $t0 >= $s3.
	bne $t2, $zero, L1 # if ($t2 != 0), s3 is still max, go to L1
	ori $s3, $t0, 0 # update max value
	ori $s4, $s2, 0 # update max index
L1: 
	addi $s2, $s2, 1 # i ++
	bne $s2, $s1, Loop # if (i != $s1), go back to loop
	done: 
	li $v0,10
	syscall
	jr $ra