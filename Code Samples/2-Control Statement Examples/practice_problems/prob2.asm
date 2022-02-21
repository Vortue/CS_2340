# practice program 2
# if (a > 0) a = -a
	.data
a:	.word	4	# change to negative to test


	.text
main:	
# your code here
	lw	$t1, a
	ble	$t1, $0, exit
	sub	$t1, $0, $t1
	sw	$t1, a

exit:	li	$v0, 10
	syscall
