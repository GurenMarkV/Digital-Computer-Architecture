;Daksh Patel 104030031

.text

start:  lui $t8,0xffff ; load $t8 with -1
            ;addiu $t1,$0,3 ; for exiting loop 1
        ori $t8,$t8,0xffff
        addiu $t0,$0,0x0000
        addu $t9,$t8,$0 ; copy to $t9 for bit inversion
        
;--------------------------------------------------------- 
;1
        addiu $t8,$t8,1 ; increment counter
        sw $t8,0($t0) ; store counter at location $t0
        addiu $t0,$t0,4 ; add 4 to memory pointer $t0
;2
        addiu $t8,$t8,1 ; increment counter
        sw $t8,0($t0) ; store counter at location $t0
        addiu $t0,$t0,4 ; add 4 to memory pointer $t0
;3
        addiu $t8,$t8,1 ; increment counter
        sw $t8,0($t0) ; store counter at location $t0
        addiu $t0,$t0,4 ; add 4 to memory pointer $t0
;4
        addiu $t8,$t8,1 ; increment counter
        sw $t8,0($t0) ; store counter at location $t0
        addiu $t0,$t0,4 ; add 4 to memory pointer $t0
;5
        addiu $t8,$t8,1 ; increment counter
        sw $t8,0($t0) ; store counter at location $t0
        addiu $t0,$t0,4 ; add 4 to memory pointer $t0
;6
        addiu $t8,$t8,1 ; increment counter
        sw $t8,0($t0) ; store counter at location $t0
        addiu $t0,$t0,4 ; add 4 to memory pointer $t0
;7
        addiu $t8,$t8,1 ; increment counter
        sw $t8,0($t0) ; store counter at location $t0
        addiu $t0,$t0,4 ; add 4 to memory pointer $t0
;8
        addiu $t8,$t8,1 ; increment counter
        sw $t8,0($t0) ; store counter at location $t0
        addiu $t0,$t0,4 ; add 4 to memory pointer $t0
        
        
;---------------------------------------------------------        


;1
        addiu $t0,$t0,-4 ; subtract 4 from memory pointer
        lw $t5,0($t0) ; load value
        xor $t5,$t5,$t9 ; XOR is by all 1’s
        sw $t5,0($t0) ; store it back
        addiu $t8,$t8,-1 ; Update counter
;2
        addiu $t0,$t0,-4 ; subtract 4 from memory pointer
        lw $t5,0($t0) ; load value
        xor $t5,$t5,$t9 ; XOR is by all 1’s
        sw $t5,0($t0) ; store it back
        addiu $t8,$t8,-1 ; Update counter
;3
        addiu $t0,$t0,-4 ; subtract 4 from memory pointer
        lw $t5,0($t0) ; load value
        xor $t5,$t5,$t9 ; XOR is by all 1’s
        sw $t5,0($t0) ; store it back
        addiu $t8,$t8,-1 ; Update counter
;4
        addiu $t0,$t0,-4 ; subtract 4 from memory pointer
        lw $t5,0($t0) ; load value
        xor $t5,$t5,$t9 ; XOR is by all 1’s
        sw $t5,0($t0) ; store it back
        addiu $t8,$t8,-1 ; Update counter
;5
        addiu $t0,$t0,-4 ; subtract 4 from memory pointer
        lw $t5,0($t0) ; load value
        xor $t5,$t5,$t9 ; XOR is by all 1’s
        sw $t5,0($t0) ; store it back
        addiu $t8,$t8,-1 ; Update counter
;6
        addiu $t0,$t0,-4 ; subtract 4 from memory pointer
        lw $t5,0($t0) ; load value
        xor $t5,$t5,$t9 ; XOR is by all 1’s
        sw $t5,0($t0) ; store it back
        addiu $t8,$t8,-1 ; Update counter
;7
        addiu $t0,$t0,-4 ; subtract 4 from memory pointer
        lw $t5,0($t0) ; load value
        xor $t5,$t5,$t9 ; XOR is by all 1’s
        sw $t5,0($t0) ; store it back
        addiu $t8,$t8,-1 ; Update counter
;8
        addiu $t0,$t0,-4 ; subtract 4 from memory pointer
        lw $t5,0($t0) ; load value
        xor $t5,$t5,$t9 ; XOR is by all 1’s
        sw $t5,0($t0) ; store it back
        addiu $t8,$t8,-1 ; Update counter
        
        
        

        halt ; Stop the code




;To check if it is possible to achieve a CPI of 1 for this code sample, the loops
;were opened and not used. The loops were only being performed a few times
;so this made sense. The oyher instructions associated with the
;loops were also removed such as bne.

;THe CPI of 1 was not acheived and through this it is assumed it is not possible
;due to the nature of instructions such as lw, sw, ori and xor 
;which contribute to the high CPI value

;The number of cycles were reduced drastically compared to part 2. 
;There are 8 RAW stalls due to the xor instruction being executed 8 times.
;Parts 1 and 2 had the addiu instruction to control the looping, which
;removed the stalls. Since the loops are not being used, the 
;addiu was removed and so the 8 RAW stalls returned.
;Comparitively the CPI still lower than part 1 and close enought to part 2,
;that the reduction in cycles and instructions may be worth the RAW Stalls.

;Enable forwarding
;Cycles: 82
;Instructions: 69
;CPI: 1.188
;RAW Stalls: 8

