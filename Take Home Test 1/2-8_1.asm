.data

a: .word 10
b: .word 20

.text
jal myadd
j exit

myadd:
lw $t1, a
lw $t2, b

add $v0, $t1, $t2
jr $ra
exit: