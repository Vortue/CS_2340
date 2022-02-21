# practice program 6
# while (s2[i] = s1[i] != '/0') i++; 
	.data
s1:	.asciiz	"hi"
	.align	2
s2:	.space	4

	.text
main:	
	la	$t1, s1
	la	$t2, s2
	li	$t0, 0
loop:
	add	$t3, $t1, $t0
	add	$t4, $t2, $t0
	lw	$t5, ($t3)
	sw	$t5, ($t4)
	addi	$t0, $t0, 1
	bne	$t5, $0, loop

exit:	li	$v0, 10
	syscall


