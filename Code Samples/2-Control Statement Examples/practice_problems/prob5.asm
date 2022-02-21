# practice program 5
# for (i=0; i<10; i++) a[i] +=5; 
	.data
a:	.word	5, 9, 2, 1, 4, 6, 3, 9, 2, 1
len:	.word	10

	.text
main:	
	li	$t0, 0
	lw	$t1, len
	sll	$t1, $t1, 2
	la	$t2, a
loop:
	add	$t3, $t0, $t2
	lw	$t4, ($t3)
	addi	$t4, $t4, 5
	sw	$t4, ($t3)
	addi	$t0, $t0, 4
	blt	$t0, $t1, loop

exit:	li	$v0, 10
	syscall

