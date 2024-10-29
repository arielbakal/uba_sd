li a0 3
li t0 6
jal fact
bne a0 t0 noFunciona
li a0 4
li t0 24
jal fact
bne a0 t0 noFunciona
j funciona

fact:
    addi sp sp -4
    sw ra 0(sp)
    addi a3 a0 1
    li a0 1
    li a1 1
    li a2 1
    jal factRecursivo
    
factRecursivo:
    mul a0 a0 a2
    addi a2 a2 1
    beq a3 a2 retornar
    j factRecursivo
    
retornar:
    lw ra 0(sp)
    addi sp sp 4
    ret

fin:
    j fin
    
noFunciona:
    li t0 0
    j fin
    
funciona:
    li t0 1
    j fin