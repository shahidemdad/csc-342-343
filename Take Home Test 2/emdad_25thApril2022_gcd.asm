.data
	a		: .word 12
	b		: .word 30
	gcd_result	: .word 0
.text

MAIN:					# main function
	lw	$a0, a			# load value for a 
	lw 	$a1, b			# load value for b
	jal	GCD			# call GCD function
	sw	$v0, gcd_result		# save the return value
	
	li	$v0, 10			# end
	syscall				#issue system call
GCD:					# calculate gcd(a,b)
	addi	$sp, $sp, -12		# adjust the stack pointer 3 times
	sw	$s1, 8($sp)		# store 1st argument
	sw	$s0, 4($sp)		# store 2nd argument
	sw	$ra, 0($sp)		# store 3rd argument
	
	add	$s0, $a0, $zero		# s0=a0=a
	add	$s1, $a1, $zero		# s0=a0=s1=b
	
	# first iter
	div	$a0, $a1		# a/b
	mfhi	$s0			# stores remainder
	sw	$s0, 4($sp)		# save remainder
	bne	$s0, $zero, L1		# if remainder != 0, brach to label
	
	# base case
	add 	$v0, $zero, $a1		# v0 = a1
	addi	$sp, $sp, 12		# adjust stack pointer to pop twice
	jr	$ra			# jump to return address(main)
L1:					# recursive
	add 	$a0, $a1, $zero		# a0 = a1, a=b
	lw	$s0, 4($sp) 		# load remainder
	add	$a1, $s0, $zero		# a1 = s0
	jal	GCD			#jump to GCD
	
	#EXIT
	lw 	$ra, 0($sp)		# restore return address
	lw 	$s0, 4($sp)		# restore 2nd argument
	lw 	$s1, 8($sp)		# restore 1st argument
	addi	$sp, $sp, 12		# adjust stack pointer to pop twice
	jr	$ra			# jump to return address
	
	#end of progra
	