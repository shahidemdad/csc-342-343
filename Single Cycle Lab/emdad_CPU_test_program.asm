.text

addi	$s0, $zero, 1
addi	$s1, $zero, 5
addu	$s2, $s1, $s0
subu	$s3, $s0, $s1
beq	$s0, $s3, Else
mult	$s1, $s0
j L1

Else:
div	$s1, $s0

L1:
addu	$s0, $s2, $s0