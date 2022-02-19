# factoral 3! recursive version
	.data
msg:	.asciiz		"3! = "
ans:	.word		0
	.text
	
	li	$a0, 3 # 3 is put in an a register, signifying the fact that it's an argument to the function
	jal	factorial # jumps unconditionally to the factorial label and saves the address of line 9 in $ra 
	sw	$v0, ans #saves the "returned" value
	
	# display the answer
	li	$v0, 4
	la	$a0, msg
	syscall
	
	li	$v0, 1
	lw	$a0, ans
	syscall
	
	# exit
	li 	$v0, 10
	syscall
##################
factorial:
	addi 	$sp, $sp, -8 # reserve 8 bytes of memory for the return address and current argument
	sw	$ra, 4($sp) # store the ra in the lower word
	sw	$a0, ($sp) # store the current argument in the upper word
	
	# Stack after call number...
	#1: [line 9 | 3 | garbage...
	#2: [line 9 | 3 | line 43 | 2 | garbage...
	#3: [line 9 | 3 | line 43 | 2 | line 43 | 1 | garbage...
	#4: [line 9 | 3 | line 43 | 2 | line 43 | 1 | line 43 | 0 | garbage...
	
	# base case
	li	$v0, 1	#set the return value to 1; this will be modified if the ble doesn't execute
	ble	$a0, $zero, done # "exit" this particular function call if the base case, argument <= 0, is true
	
	# call factorial(n-1)
	addi	$a0, $a0, -1 #since the argument is not less than or equal to 0, decrement it by one and
	jal	factorial #recursively call the function again
	
	# returns here
	#this contains the things you don't want to happen in the function call where the base case is true,
	#but you want to happen in all other function calls
	#for example, in this instance, you don't want to multiply when the base case it true because you'll end up with zero,
	#but you want to multiply every other number. The sequence of instructions and the label they are under is important
	
	lw	$a0, ($sp)	# $a0 was probably overwritten in a lower level of recursion, so restore it to the value it has in this level (this value was previously saved to the stack for this very purpose)
	mul	$v0, $a0, $v0	# multiply the current argument by the current return value and "return" it
	
done:
	lw	$ra, 4($sp) #place the most recent return address in the stack in $ra so the pc goes to the right place after this function call terminates
	addi	$sp, $sp, 8 # "deallocate" the 8 bytes of stack memory that were previously used to store the return address and argument
	
	jr	$ra # jump unconditionally to the return address, which is the line right after the function was called (if you did it right heehee)
	
	# Stack after return number...
	#4: [line 9 | 3 | line 43 | 2 | line 43 | 1 | garbage...
	#3: [line 9 | 3 | line 43 | 2 | garbage...
	#2: [line 9 | 3 | garbage...
	#1: [garbage...
		
	
