## test case ##

main: li s1, 2024 
mv a0, s1
jal ra, INVERTIR
add a0, s1, a0
bnez a0, noFunciona
funciona: li a1, 1
j fin
noFunciona: li a1, 0
fin: j fin

INVERTIR: addi sp, sp, -4 # prologo        
sw ra, (0)sp              # 
not t1, a0                
addi a0, t1, 1            
lw ra, (0)sp              # epilogo  
addi sp, sp, 4            #    
ret                       #

