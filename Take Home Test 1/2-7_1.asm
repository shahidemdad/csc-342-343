.data
a: .word 0
b: .word 50
c: .word 40
d: .word 30
e: .word 20

.text
lw $s0, a
lw $s1, b
lw $s2, c
lw $s3, d
lw $s4, e

bne $3, $s4, Else

add $s0, $s1, $s2

Else:
sub $s0, $s1, $s2
Exit:
sw $s0, a

