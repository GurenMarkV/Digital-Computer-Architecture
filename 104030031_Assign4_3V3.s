;Daksh Patel 104030031
;104030031_Assign4_3V3.s
.text

start:  lui $t8,0xffff ; load $t8 with -1
        ori $t8,$t8,0xffff
        addiu $t0,$0,0x0000
        addu $t9,$t8,$0 ; copy to $t9 for bit inversion
        
;--------------------------------------------------------- 
;1
        addiu $t8,$t8,1 ; increment counter
        sw $t8, 0($t0) ; store counter at location $t0
;2
        addiu $t8,$t8,1 ; increment counter
        sw $t8, 4($t0) ; store counter at location $t0
;3
        addiu $t8,$t8,1 ; increment counter
        sw $t8, 8($t0) ; store counter at location $t0
;4
        addiu $t8,$t8,1 ; increment counter
        sw $t8, 12($t0) ; store counter at location $t0
;5
        addiu $t8,$t8,1 ; increment counter
        sw $t8, 16($t0) ; store counter at location $t0
;6
        addiu $t8,$t8,1 ; increment counter
        sw $t8, 20($t0) ; store counter at location $t0
;7
        addiu $t8,$t8,1 ; increment counter
        sw $t8, 24($t0) ; store counter at location $t0
;8
        addiu $t8,$t8,1 ; increment counter
        sw $t8, 28($t0) ; store counter at location $t0
        
        
;---------------------------------------------------------        


;1
        ; load value
        lw $t1, 28($t0)     ;loads 7
        lw $t2, 24($t0)     
        lw $t3, 20($t0)     
        lw $t4, 16($t0)   
        lw $t5, 12($t0)      
        lw $t6, 8($t0)
        lw $t7, 4($t0)
        lw $t8, 0($t0)

        ; XOR is by all 1’s
        xor $t1,$t1,$t9     ;inverts 7
        xor $t2,$t2,$t9 
        xor $t3,$t3,$t9 
        xor $t4,$t4,$t9 
        xor $t5,$t5,$t9 
        xor $t6,$t6,$t9 
        xor $t7,$t7,$t9 
        xor $t8,$t8,$t9 

        ; store it back
        sw $t1, 28($t0)     ;stores inverted 7
        sw $t2, 24($t0)     
        sw $t3, 20($t0)     
        sw $t4, 16($t0)   
        sw $t5, 12($t0)      
        sw $t6, 8($t0)
        sw $t7, 4($t0)
        sw $t8, 0($t0)


        halt ; Stop the code


;To check if it is possible to achieve a CPI of 1 for this code sample, the loops
;were opened and not used. The loops were only being performed a few times
;so this made sense. The other instructions associated with the
;loops were also removed such as bne, sltiu, beq.

;THe CPI of 1 was not acheived and through this it is assumed it is not possible
;due to the nature of instructions such as lw, sw, ori, addiu and xor 
;which contribute to the CPI value

;The number of cycles were reduced drastically compared to part 2. 
;There are 0 RAW stalls due to the xor instruction working without delay.

;Comparitively the CPI still lower than part 1 and part 2

;Enable forwarding
;Cycles: 50
;Instructions: 45
;CPI: 1.111
;RAW Stalls: 0

;Some Things to Note
;CPI = (Cycles-5)/Instructions
;Branch Stalls = Cycles - Instruction - Raw Stalls - 5
;CPI = (50-5)/45 = 1 ---> Meaning accurate CPI of 1 is achievable through this method
;Branch Stalls = 0
