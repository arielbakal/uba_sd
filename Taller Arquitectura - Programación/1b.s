main: li a0, 4
li a1, 6
jal ra, SUMA
li a2, 10
bne a0, a2, noFunciona
funciona: li a1, 1
j fin
noFunciona: li a1, 0
fin: j fin

SUMA: addi sp, sp, -4 # prologo
sw ra, (0)sp          #  
add a0, a0, a1     
lw ra, (0)sp          # epilogo  
addi sp, sp, 4        # 
ret