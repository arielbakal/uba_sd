main:
    li a1 2
    li a2 0
    li a3 1
    li a4 1
    li t1 1
    jal ra FIBONACCI
    bne a0 t1 noFunciona
    li a0 0
    li a1 5
    li a4 1
    li t1 5
    jal ra FIBONACCI
    bne a0 t1 noFunciona
    j funciona

FIBONACCI:
     beq a1 x0 terminar
     beq a4 a1 terminar
     add a0 a2 a3
     addi a4 a4 1
     addi a2 a3 0
     addi a3 a0 0
     j FIBONACCI  
     
terminar:
    li a2 0
    li a3 1
    ret
     
FIN:
     j FIN
     
funciona:
     li t0, 1
     j FIN
     
noFunciona:
     li t0, 0
     j FIN