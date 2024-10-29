li a0, 4 # x para F3(x)
jal fibonacci
li t1 6
bne a0 t1 noFunciona
li a0, 3 # x para F3(x)
jal fibonacci
li t1 3
bne a0 t1 noFunciona
j funciona

fibonacci:
    addi sp sp -4
    sw ra 0(sp)
    
    #x == 0
    li t1, 0
    beq a0, t1, casoBase0
    #x == 1
    li t1, 1
    beq a0, t1, casoBase1
    #x == 2
    li t1, 2
    beq a0, t1, casoBase2

    li t1, 0       # F3(0)
    li t2, 1       # F3(1)
    li t3, 2       # F3(2)
    
    # contador
    li t4, 3
    mv t5 a0
    addi t5 t5 1
    li a0 0
    j fibonacciRecursivo
    
   

fibonacciRecursivo:
    add a0, t1, t2    # t5 = F3(x-1) + F3(x-2)
    add a0, a0, t3    # t5 = F3(x-1) + F3(x-2) + F3(x-3)

    mv t1, t2        # F3(x-2) -> F3(x-3)
    mv t2, t3        # F3(x-1) -> F3(x-2)
    mv t3, a0        # t5 -> F3(x)

    addi t4, t4, 1
    bne t4, t5, fibonacciRecursivo

    lw ra 0(sp)
    addi sp sp 4
    ret


casoBase0:
    li a0, 0
    lw ra 0(sp)
    addi sp sp 4
    ret

casoBase1:
    li a0, 1
    lw ra 0(sp)
    addi sp sp 4
    ret

casoBase2:
    li a0, 2
    lw ra 0(sp)
    addi sp sp 4
    ret

noFunciona:
    li t0 0
    j fin
    
funciona:
    li t0 1
    j fin

fin:
    j fin