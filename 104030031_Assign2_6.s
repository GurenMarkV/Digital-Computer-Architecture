# Comment liberally!
 .data      #data directive - indicates the following data items are stored in the data segment
A: .word 1    #incrementing the values later
B: .word 2
C: .word 0

message:
 .asciiz "\n Adding "   # create new line at the beginning of the message instead of creating new message for it
and:
 .asciiz " and "
eq:
 .asciiz " = "

.text  
 
main:
 lw $s0,A       # load value from A to register s0
 lw $s1,B       # load value from B to register s1

loop:
 bgt $s1,10,exit    # go to exit when the register equals 11 or greater
 
 jal leaf_example   #calling function

 li $v0,4       
 la $a0,message       # prints message
 syscall


 li $v0,1        # print int with value A
 move $a0,$s0       
 syscall

 li $v0,4       # print string
 la $a0,and       
 syscall

 li $v0,1        # print int with value B
 move $a0,$s1       #move
 syscall
 
 li $v0,4       
 la $a0,eq       # prints =
 syscall
 
 li $v0,1        # print int with value B
 lw $a0,C       
 syscall

 addi $s1,$s1,1 #increment B
 addi $s0,$s0,1 #increment A


 j loop     # jump to loop
exit:

 li $v0, 10       # 
 syscall        # calls to the kernel - end of program

#
 leaf_example:    #the adding mechanism as its own function now
  add $s2,$s0,$s1
  sw $s2,C
  jr $ra
