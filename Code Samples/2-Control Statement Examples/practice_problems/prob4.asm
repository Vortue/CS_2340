# practice program 4
# for (i=0; i<10; i++) c +=5;  # use immediate load/add instructions

	.data
c:	.word	0

	.text
main:	
	li	$t0, 0
	li	$t1, 10
	lw	$t2, c
loop:
	addi	$t2, $t2, 5
	addi	$t0, $t0, 1
	blt	$t0, $t1, loop
	sw	$t2, c

exit:	li	$v0, 10
	syscall



