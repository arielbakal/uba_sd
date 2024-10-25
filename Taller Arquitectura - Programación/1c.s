main: li a0, 1                                # TEST 1    
li a1, 2                                       
jal ra, ECUACION                                       
li a3, 3                                       
bne a0, a3, noFunciona # (4*1 - 2/2) != 3       
li a0, 3                                      # TEST 2  
jal ra, ECUACION                               
li a3, 11                                        
bne a0, a3, noFunciona # (4*3 - 2/2) != 11 
li a0, 3                                      # TEST #
li a1, 12
jal ra, ECUACION
li a3, 6
bne a0, a3, noFunciona # (4*3 - 12/2) != 6
funciona: li a1, 1
j fin
noFunciona: li a1, 0
fin: j fin

ECUACION: addi sp, sp, -4 # prologo
sw ra, (0)sp             #
slli t2, a0, 2
srai t1, a1, 1
sub a0, t2, t1
li t1, 0                 # epilogo
li t2, 0                 #
lw ra, (0)sp             # 
addi sp, sp, 4           #     
ret
