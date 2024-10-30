main: 
    li a0, 4
    li a1, 87
    li a2, -124
    li a3, -14
    jal ra, FUNCION
    li a2, -124
    bne a0, a2, noFunciona
funciona: 
    li a1, 1
    j fin
noFunciona: 
    li a1, 0
fin:
    j fin
    
FUNCION: 
    addi sp, sp, -12 #Prologo
    sw ra, (0)sp
    sw a2, (4)sp
    sw a3, (8)sp      # Fin Prologo
    jal ra, AUX
    mv s1, a0
    lw a0, (8)sp
    lw a1, (12)sp
    jal ra, AUX
    mv a1, s1
    jal ra, AUX
    lw ra, (12)sp      #Epilogo
    addi sp, sp, 20     #Fin epilogo
    ret
    
AUX: 
    addi sp, sp, -4 #Prologo
    sw ra, (0)sp         #Prologo
    bgt a1, a0, terminar
    mv a0, a1
    
terminar: 
    ret