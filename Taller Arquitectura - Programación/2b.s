li a0 0 #x1
li a1 0 #x2
li a2 0 #y1
li a3 0 #y2
jal comparar
bne a0 x0 noFunciona
li a0 1 #x1
li a1 0 #x2
li a2 1 #y1
li a3 0 #y2
jal comparar
li t0 1
bne a0 t0 noFunciona
j funciona

comparar:
     slt t0 a1 a0
     slt t1 a3 a2
     and t2 t0 t1
     li t3 1
     beq t2 t3 caso1
     
     slt t0 a0 a1
     slt t1 a2 a3
     and t2 t0 t1
     beq t2 t3 caso2
     
     j caso3
      
caso1:
    li a0 1
    ret

caso2:
    li a0 -1
    ret
    
caso3:
    li a0 0
    ret
    
noFunciona:
    li t0 0
    j fin
    
funciona:
    li t0 1
    j fin
    
fin:
    j fin