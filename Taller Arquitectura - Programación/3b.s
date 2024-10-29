main: 
    li a0, 3
    li a1, 10
    li a2, -5
    li a3, 2
    li a4, 5
    li a5, -1
    jal ra, NumerosEnRangos
    li t0, 1
    bne a0, t0, noFunciona #a0 != 1

funciona: 
    li a1, 1
    j fin
noFunciona: 
    li a1, 0
fin: 
    j fin
    
NumerosEnRangos: # a0 < a1 < a4 && a2 < a5 < a3 
    addi sp, sp, -8  #Prologo
    sw a2, (0)sp
    sw ra, (4)sp     #Fin prologo
    
    li s0, 1
    mv a2, a4
    jal ra, EnRango # a0=3, a1=10, a2=5=a4  -> a0=1 si adentr o 0 si afuera
    # a0 < a1 < a4
    bne a0, s0, return # Evalua si el resultado de la f de arriba es distinto de 1
    lw a0, (0)sp # a0 -> a2
    addi sp sp 4
    mv a1, a3 # a1 pasa de 10 a 2
    mv a2, a5 # a2 pasa de 5 a -1
    jal ra, EnRango # a0=-5, a1=2, a2=-1  -> a0=1 si adentr o 0 si afuera
    # a2 < a5 < a3 
    bne a0, s0, return
    
    lw ra, (0)sp    #Epilogo
    addi sp, sp, 4  #Epilogo
    
return: 
    ret
    
EnRango:
    addi sp, sp, -4 #Prologo
    sw ra, (0)sp    #Fin prologo
    
    sub a3, a2, a0 # a2 > a0
    blt a3, zero, afuera
    sub a5, a2, a1 # a2 < a1
    bgt a5, zero, afuera # a0 < a2 < a1

adentro: 
    li a0, 1
    j terminar

afuera: 
    li a0, 0

terminar: 
    lw ra, (0)sp
    addi sp, sp, 4
    ret