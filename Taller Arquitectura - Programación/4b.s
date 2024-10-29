.data
array1:
    .word 1
    .word 2
    .word 3
    .word 4
    .word 0
array2:
    .word 2
    .word 2
    .word 2
    .word 0
array3:
    .word 3
    .word 5
    .word 9
    .word 0

.text
main:
    # test 1
    la a0, array1         # load address del array
    li a1, 3              # respuesta esperada
    jal contarPotenciasDeDos
    bne a0, a1, noFunciona
    # test 2
    la a0, array2      
    li a1, 3           
    jal contarPotenciasDeDos
    bne a0, a1, noFunciona
    # test 3
    la a0, array3      
    li a1, 0           
    jal contarPotenciasDeDos
    bne a0, a1, noFunciona 
funciona:
    li a3, 1
    j fin
noFunciona:
    li a3, 0
    j fin  
fin:
    j fin

contarPotenciasDeDos:
    addi sp, sp, -4       # reservo espacio en el stack para ra
    sw ra, 0(sp)          # guardo ra en el stack
    li t0, 0              # contador
    lw t2, 0(a0)          # primer elem del array
contarPotenciasDeDosAux:
    beq t2, zero, retornar # Si elem = 0 (final del arreglo), salir
    mv a2, t2             # parametro a2 para esPotenciaDeDos
    addi sp, sp, -4       # reservo espacio para ra antes de la llamada
    sw ra, 0(sp)          # guardo ra 
    jal esPotenciaDeDos  
    lw ra, 0(sp)          # restauro ra
    addi sp, sp, 4        # libero posicion del stack
    addi a0, a0, 4        # siguiente posicion del array
    lw t2, 0(a0)          # elem siguiente del array
    beq t1, zero, sumarContador # si t1=0, es potencia de dos y sumo al contador
    j contarPotenciasDeDosAux # sino, continuo iterando 
    
sumarContador:
    addi t0, t0, 1        
    j contarPotenciasDeDosAux 

retornar:
    mv a0, t0             # retornar el contador en a0
    lw ra, 0(sp)          # restaurar ra del stack
    addi sp, sp, 4        # liberar stack
    ret
    
esPotenciaDeDos:
    # Un número es potencia de 2 si y solo si tiene un único bit en 1
    addi t4, a2, -1       
    and t1, a2, t4        
    ret 