li t0 1
li t1 2
li t2 3
li s0 0x10000000
li s1 0x0ffffffc
sw t0 0(s0)
addi s0 s0 4
sw t1 0(s0)
addi s0 s0 4
sw t2 0(s0)
addi t5 s0 0
jal invertirArreglo
jal test1
li t0 0
li t1 0
li t2 0
li s0 0x10000000
li s1 0x0ffffffc
sw t0 0(s0)
addi s0 s0 4
sw t1 0(s0)
addi s0 s0 4
sw t2 0(s0)
addi t5 s0 0
jal invertirArreglo
jal test2
j funciona

invertirArreglo:
    addi t6 ra 0
    beq s0 s1 terminar
    
    lw a0 0(s0)
    jal inverso
    addi ra t6 0
    sw a0 0(s0)
    addi s0 s0 -4
    j invertirArreglo  

inverso:
    li t0 1
    not a0 a0
    addi a0 a0 1
    ret
    
terminar:
    addi s0 t5 0
    ret
    
test1:
    li t0 -3
    li t1 -2
    li t2 -1
    lw a0 0(s0)
    bne a0 t0 noFunciona
    addi s0 s0 -4
    lw a0 0(s0)
    bne a0 t1 noFunciona
    addi s0 s0 -4
    lw a0 0(s0)
    bne a0 t2 noFunciona
    ret
    
test2:
    li t0 0
    li t1 0
    li t2 0
    lw a0 0(s0)
    bne a0 t0 noFunciona
    addi s0 s0 -4
    lw a0 0(s0)
    bne a0 t1 noFunciona
    addi s0 s0 -4
    lw a0 0(s0)
    bne a0 t2 noFunciona
    ret
    
noFunciona:
    li t0 0
    j fin
    
funciona:
    li t0 1
    j fin
    
fin:
    j fin