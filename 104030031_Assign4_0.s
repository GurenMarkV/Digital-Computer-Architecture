.text

start:  lui $t8,0xffff ; load $t8 with -1
        ori $t8,$t8,0xffff
        addu $t9,$t8,$0 ; copy to $t9 for bit inversion
        addiu $t0,$0,0x0000

loop1:  addiu $t8,$t8,1 ; increment counter
        sw $t8,0($t0) ; store counter at location $t0
        addiu $t0,$t0,4 ; add 4 to memory pointer $t0
        sltiu $at,$t8,7 ; loop until we’ve done 8 loops
        bne $at,$0,loop1

loop2:  addiu $t0,$t0,-4 ; subtract 4 from memory pointer
        lw $t5,0($t0) ; load value
        xor $t5,$t5,$t9 ; XOR is by all 1’s
        sw $t5,0($t0) ; store it back
        addiu $t8,$t8,-1 ; Update counter
        beq $t8,$t9,loop3 ; Do it 8 times
        j loop2

loop3:  halt ; Stop the code

;Before enabling Forwarding
;220 Cycles
;100 Instructions
;2.2 CPI
;100 RAW Stalls
