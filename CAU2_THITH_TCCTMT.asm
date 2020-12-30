.data
str1: .asciiz	"Nhap 1 so n: "
str2: .asciiz "Tong tu 0 den n la: "
.text
	li $v0,4
	la $a0,str1
	syscall
	
loop1:	li $v0,5
	syscall
	move $t0,$v0
	
	addi $t1,$0,100
	addi $t2,$0,1
	
	slti $t3,$t0,1
	beq $t3,$t2,loop1
	
	slt $t4,$t1,$t0
	beq $t4,$t2,loop1

	# thuc thi
	
	addi $t1,$0,0  # bien dem
	addi $t2,$t0,1
	addi $t3,$0,0 # sum = 0
	
loop2:	beq $t1,$t2,exit
	add $t3,$t3,$t1
	addi $t1,$t1,1
	j loop2
exit:
	la $a0,str2
	li $v0,4
	syscall
	
	li $v0,1
	add $a0,$0,$t3
	syscall 
	
