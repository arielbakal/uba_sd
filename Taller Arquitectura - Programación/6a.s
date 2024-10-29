.data
InformacionAlumno1:
    .half 5491
    .byte 1
    .half 1111
    .byte 1
    .half 0
InformacionAlumno2:
    .half 5490
    .byte 5
    .half 1111
    .byte 1
    .half 9999
    .byte 3
    .half 7770
    .byte 5
    .half 0
    
.text
main:
    # test 1
    la a0, InformacionAlumno1
    li a1, 2                    # total de las notas
    li a2, 0                    # bytes contados
    jal sumarNotasIdImpar
    bne a0, a1, noFunciona
    # test 2
    la a0, InformacionAlumno2
    li a1, 4
    li a2, 0
    jal sumarNotasIdImpar
    bne a0, a1, noFunciona
funciona:
    li a4, 1
    j fin
noFunciona:
    li a4, 0
    j fin  
fin:
    j fin
    
sumarNotasIdImpar:
    addi sp, sp, -4
    sw ra, 0(sp)
    li t0, 0     # suma
sumarNotasIdImparAux:
    lh t1, 0(a0)            # siguiente id
    lb t2, 2(a0)            # siguiente nota
    beq t1, zero, retornar
    addi a2, a2, 3          # sumo 3 bytes (2 bytes del id en half, 1 byte de la nota)
    addi sp, sp, -4
    sw ra, 0(sp)
    mv a3, t1               # pasar a0=id como parametro a esImpar
    jal esImpar
    lw ra, 0(sp)
    addi sp, sp, 4
    addi a0, a0, 3          # posicion del half del siguiente alumno
    bne a3, zero, sumarNota # si a2!=0, entonces a2=1 (porque aisle el bit) y es impar
    j sumarNotasIdImparAux
        
sumarNota:
    add t0, t0, t2
    j sumarNotasIdImparAux
    
retornar:
    mv a0, t0
    lw ra, 0(sp)
    addi sp, sp, 4
    ret
    
esImpar:
    # un numero es impar si y solo si su bit menos significado es 1
    andi a3, a3, 1  # aislo el bit menos significado 
    ret