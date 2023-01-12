#  C CODE
#  int arr[9] = {8,1,4,5,6,3,2,9,7};
#  void main() {
#  int i = 0;
#  int sum = 0;
#  while(i < 10) {
#  sum = sum + arr[i];
#  i++;
#  }
#  printf(“sum of numbers in array:”);
#  printf(“%d”,sum);
#  }


.data
arr: .word 8,1,4,5,6,3,2,9,7
msg: .asciiz "sum of numbers in array:"

.text
.globl main
main:
	addi $t0, $0, 0 # i
	addi $t1, $0, 0 # sum
	ori $t2, $0, 9 # constant 9
	la $t3, arr  # load address of array into t3
	loop:
	slt $t4, $t0, $t2  # compare t0 and t2. 
	beq $t4, $0, end  # if i is not < 9, exit the loop
	lw $t4, 0($t3)
	add $t1, $t1, $t4  # sum+=t4
	add $t0, $t0, 1 # i++
	add $t3, $t3, 4 
	j loop

	end:
	
	addi $v0, $0, 4 # Now print out result: string
	la $a0, msg
	syscall
	
	addi $v0, $0, 1 # sum (in t1)
	add $a0, $t1, $0
	syscall
	jr $ra
	