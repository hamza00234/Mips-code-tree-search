.data
array: .word 1,2,4,8,9,5,10,11,3,6,12,13,7,14,15
length: .word 15
int: .word 7

.text
.globl main

main:
    
   la $a1, int      
    lw $a1, 0($a1)   
    la $a0, array   
    lw $a2, length   
    
    
    jal convertArrayr2tor1
    
    
   move $a0, $v0    
    li $v0, 1       
    syscall  

    
    li $v0, 10
    syscall

convertArrayr1tor2:
  
    addi $sp, $sp, -8
    sw $t4, 0($sp)
    sw $t5, 4($sp)
    slti $t5,$a2,4
    bne $t5,$zero,return
    
    slti $t4,$a2,8
    beq $t4,$zero,length15_p1

    # Swap the elements 2 and 3
    lw $t0, 8($a0)   
    lw $t1, 12($a0)  
    sw $t1, 8($a0)  
    sw $t0, 12($a0)  

    # Swap the elements 3 and 4
    lw $t2, 12($a0)  
    lw $t3, 16($a0)  
    sw $t3, 12($a0)  
    sw $t2, 16($a0)  
   
    jr $ra
    
    length15_p1:
    # Load elements to swap into temporary registers
    lw $t0, 12($a0)   # Load x[3] into $t0
    lw $t1, 28($a0)   # Load x[7] into $t1
    lw $t2, 32($a0)   # Load x[8] into $t2
    lw $t3, 16($a0)   # Load x[4] into $t3
    lw $t4, 36($a0)   # Load x[9] into $t4
    lw $t5, 40($a0)   # Load x[10] into $t5
    lw $t6, 8($a0)    # Load x[2] into $t6
    lw $t7, 20($a0)   # Load x[5] into $t7
    lw $t8, 44($a0)   # Load x[11] into $t8
    lw $t9, 48($a0)   # Load x[12] into $t9
    lw $s0, 24($a0)  # Load x[6] into $t10
    
    # Swap the elements
    sw $t0, 8($a0)    # Store $t0 into x[2]
    sw $t1, 12($a0)   # Store $t1 into x[3]
    sw $t2, 16($a0)   # Store $t2 into x[4]
    sw $t3, 20($a0)   # Store $t3 into x[5]
    sw $t4, 24($a0)   # Store $t4 into x[6]
    sw $t5, 28($a0)   # Store $t5 into x[7]
    sw $t6, 32($a0)   # Store $t6 into x[8]
    sw $t7, 36($a0)   # Store $t7 into x[9]
    sw $t8, 40($a0)   # Store $t8 into x[10]
    sw $t9, 44($a0)   # Store $t9 into x[11]
    sw $s0, 48($a0)  # Store $t10 into x[12]
    addi $sp, $sp, 8
    lw $t4, 0($sp)
    lw $t5, 4($sp) 

    jr $ra           
    
   return:
    lw $t4, 0($sp)
    lw $t5, 4($sp) 
    addi $sp, $sp, 8
   jr $ra 
    
convertArrayr2tor1:
    addi $sp, $sp, -8
    sw $t4, 0($sp)
    sw $t5, 4($sp)
    slti $t5,$a2,4
    bne $t5,$zero,return
    
    slti $t4,$a2,8
    beq $t4,$zero,length15_p2

    # Swap the elements 2 and 3
    lw $t0, 8($a0)   
    lw $t1, 12($a0)  
    sw $t1, 8($a0)   
    sw $t0, 12($a0)  

    # Swap the elements 2 and 4
    lw $t2, 8($a0)  
    lw $t3, 16($a0) 
    sw $t3, 8($a0)   
    sw $t2, 16($a0) 
    
    
    
    jr $ra
    
    length15_p2:
        # Swap the elements 2 and 3
    lw $t0, 8($a0)     
    lw $t1, 12($a0)    
    sw $t1, 8($a0)     
    sw $t0, 12($a0)    

      # Swap the elements 8 and 2
    lw $t0, 32($a0)    
    lw $t1, 8($a0)    
    sw $t1, 32($a0)    
    sw $t0, 8($a0)     

      # Swap the elements 4 and 5
    lw $t0, 16($a0)    
    lw $t1, 20($a0)    
    sw $t1, 16($a0)   
    sw $t0, 20($a0)    

      # Swap the elements 9 and 5
    lw $t0, 20($a0)    
    lw $t1, 36($a0)    
    sw $t1, 20($a0)  
    sw $t0, 36($a0)    

      # Swap the elements 12 and 6
    lw $t0, 48($a0)    
    lw $t1, 24($a0)    
    sw $t1, 48($a0)    
    sw $t0, 24($a0)    

     # Swap the elements 7 and 9
    lw $t0, 28($a0)    
    lw $t1, 36($a0)    
    sw $t1, 28($a0)    
    sw $t0, 36($a0)    

      # Swap the elements 7 and 8
    lw $t0, 28($a0)    
    lw $t1, 32($a0)   
    sw $t1, 28($a0)    
    sw $t0, 32($a0)    

      # Swap the elements 9 and 12
    lw $t0, 36($a0)    
    lw $t1, 48($a0)    
    sw $t1, 36($a0)    
    sw $t0, 48($a0)    

     # Swap the elements 10 and 12
    lw $t0, 40($a0)    
    lw $t1, 48($a0)    
    sw $t1, 40($a0)    
    sw $t0, 48($a0)    

      # Swap the elements 11 and 12
    lw $t0, 44($a0) 
    lw $t1, 48($a0)   
    sw $t1, 44($a0)    
    sw $t0, 48($a0)   
    
    addi $sp, $sp, 8
    lw $t4, 0($sp)

    jr $ra             
    
   findr1:
    addi $sp, $sp, -36  
    sw $t2, 32($sp)
    sw $ra, 28($sp)     
    sw $t0, 24($sp)   
    sw $t1, 20($sp)     
    sw $s0, 16($sp)     
    sw $s1, 12($sp)     
    sw $s2, 8($sp)   
    sw $s3, 4($sp)      
    sw $s4, 0($sp)      



    addi $t0, $zero, 0  # Index counter
    addi $v0, $zero, -1 # Default return value
    slti $t2,$a2,8
    bne $t2,$zero,findr17
   

loop1:
    beq $t0, $a2, break # if index counter equals length, break
    lw $t1, 0($a0)      # load value from array
    beq $t1, $a1, check # if value equals int, go to check
    addi $t0, $t0, 1    # increment index counter
    addi $a0, $a0, 4    # move to next array element
    j loop1             

break:
    lw $ra, 28($sp)    
    lw $t0, 24($sp)     
    lw $t1, 20($sp)    
    lw $s0, 16($sp)     
    lw $s1, 12($sp)     
    lw $s2, 8($sp)      
    lw $s3, 4($sp)      
    lw $s4, 0($sp)      
    addi $sp, $sp, 32   
    jr $ra              

check:
    addi $s0, $zero, 0 
    addi $s1, $zero, 1 
    addi $s2, $zero, 2 
    addi $s3, $zero, 5 
    addi $s4, $zero, 8  
    addi $s5, $zero, 9
    addi $s6, $zero, 12 
    
    beq $t0, $s0, l1
    beq $t0, $s1, l2
    beq $t0, $s2, l3
    beq $t0, $s3, l3
    beq $t0, $s4, l2
    beq $t0, $s5, l3
    beq $t0, $s6, l3
    # else part
    addi $v0, $zero, 4
    j break



l1:
    addi $v0, $zero, 1
    j break

l2:
    addi $v0, $zero, 2
    j break

l3:
    addi $v0, $zero, 3
    j break
    
findr17:
   
    addi $t0, $zero, 0  # Index
   

loop2:
    beq $t0, $a2, break
    lw $s0, 0($a0)
    beq $s0, $a1, found
    addi $t0, $t0, 1
    addi $a0, $a0, 4
    j loop2

found:
   
    addi $s1,$zero,0
     addi $s2,$zero,1
     addi $s3,$zero,2
    beq $t0, $s1, level1
    beq $t0, $s2, level2
    beq $t0, $s3, level2
   addi $v0,$zero, 3
    j break

level1:
   addi $v0,$zero, 1
    j break

level2:
    addi $v0,$zero, 2
    j break  
    
      
findr2:
 addi $sp, $sp, -36 
    sw $t2,32($sp)    
    sw $ra, 28($sp)     
    sw $t0, 24($sp)     
    sw $t1, 20($sp)     
    sw $s0, 16($sp)    
    sw $s1, 12($sp)    
    sw $s2, 8($sp)     
    sw $s3, 4($sp)      
    sw $s4, 0($sp)      

    addi $t0, $zero, 0
    addi $v0, $zero, -1 
   

loop1_r2:
    beq $t0, $a2, break_r2 
    lw $t1, 0($a0)      
    beq $t1, $a1, check_r2 
    addi $t0, $t0, 1    
    addi $a0, $a0, 4    
    j loop1_r2             

break_r2:
    lw $ra, 28($sp)   
    lw $t0, 24($sp)     
    lw $t1, 20($sp)     
    lw $s0, 16($sp)    
    lw $s1, 12($sp)     
    lw $s2, 8($sp)      
    lw $s3, 4($sp)      
    lw $s4, 0($sp)      
    addi $sp, $sp, 32   
    jr $ra              

check_r2:
     slti $t2,$a2,4
    bne $t2,$zero,check_length3
    addi $s0, $zero, 0  
    addi $s1, $zero, 1  
    addi $s2, $zero, 2  
    addi $s3, $zero, 5  
    addi $s4, $zero, 8  
    addi $s5, $zero, 9  
    addi $s6, $zero, 12 
    
    beq $t0, $s0, l1_r2
    beq $t0, $s1, l2_r2
    beq $t0, $s2, l3_r2
    beq $t0, $s3, l3_r2
    beq $t0, $s4, l2_r2
    beq $t0, $s5, l3_r2
    beq $t0, $s6, l3_r2
    # else  part
    addi $v0, $zero, 4
    j break_r2

check_length3:
 addi $s0, $zero, 0  
    addi $s1, $zero, 1  
    addi $s2, $zero, 2  

    beq $t0, $s0, l1_r2
    beq $t0, $s1, l2_r2
    beq $t0, $s2, l2_r2
    j break_r2
l1_r2:
    addi $v0, $zero, 1
    j break_r2

l2_r2:
    addi $v0, $zero, 2
    j break_r2

l3_r2:
    addi $v0, $zero, 3
    j break_r2