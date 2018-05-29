;Daksh Patel 104030031

.text

start:  lui $t8,0xffff ; load $t8 with -1
        addiu $t1,$0,3 ; for exiting loop 1
        ori $t8,$t8,0xffff
        addiu $t0,$0,0x0000
        addu $t9,$t8,$0 ; copy to $t9 for bit inversion

loop1:  addiu $t8,$t8,1 ; increment counter
        sw $t8,0($t0) ; store counter at location $t0
        sltiu $at,$t8,7 ; loop until we’ve done 8 loops
        addiu $t0,$t0,4 ; add 4 to memory pointer $t0
        
        bne $at,$0,loop1

loop2:  addiu $t0,$t0,-4 ; subtract 4 from memory pointer
        lw $t5,0($t0) ; load value
        addiu $t8,$t8,-1 ; Update counter
        xor $t5,$t5,$t9 ; XOR is by all 1’s
        sw $t5,0($t0) ; store it back

        beq $t8,$t9,loop3 ; Do it 8 times
        j loop2

loop3:  halt ; Stop the code


;The number of stalls were reduced by rearranging commands in all three sections. 
;And changing beq in loop2 to bne. addiu and addu

;Disable forwarding
;Cycles: 187
;Instructions: 101
;CPI: 1.851
;RAW Stalls: 66

;Some Things to Note
;CPI = (Cycles-5)/Instructions
;Branch Stalls = Cycles - Instruction - Raw Stalls - 5
;CPI = (187-5)/101 = 1.80198 
;Branch Stalls = 15