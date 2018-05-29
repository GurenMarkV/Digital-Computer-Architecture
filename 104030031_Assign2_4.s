# Comment liberally!
 .data      #data directive - indicates the following data items are stored in the data segment
A: .word 88     #88 is the word i chose 
B: .word 1      # starting with 1 and incrementing to 10
C: .word 0	# starting with 0, will get values later
 ###############################################################
message:
 .asciiz "The result of adding "    # asciiz stores the string in memory and null terminate it
and:
 .asciiz " and "
is:
 .asciiz " is " 
newline: .asciiz "\n"   # create a new line

  .text		# indicates the following items are stores in the user text segment such as instructions
main:
 lw $s0,A       #load word value of A in s0
 lw $s1,B       #do for b

loop:
 bge $s1,11,exit    # go to exit when the register equals 11 or greater
 
 add $s2,$s0,$s1       # add words A and B together and store in register s2
 sw $s1,B         # storing values into words B and C to display later. A does not change
 sw $s2,C       #   store s2 as label c
 
 # v0 Values for Function Results and Expression Evaluation
 li $v0,4       #   immediately loard the system call for print string
 la $a0,message       # display message
 syscall       #    calls to the kernel, or in this case the simulator, so it prints the message

 li $v0,1        # print int with system call, the int is A which is 88
 lw $a0,A       
 syscall

 li $v0,4       
 la $a0,and       
 syscall

 li $v0,1        # print int with system call, the int is B which is incrementing
 lw $a0,B       
 syscall

 li $v0,4       # print string 'is'
 la $a0,is      
 syscall
 
 li $v0,1       #   1 means print_int so printing the value of C 
 lw $a0,C       #   a0 is arguments to callee, display number 18 int
 syscall       #    calls to the kernel, system call OS like services - perform the task
 
 li $v0,4       
 la $a0,newline      # creates a new line for better spacing
 syscall

 addi $s1,$s1,1   # add immediate 1 to s1 and store in s1
 j loop           # jump to loop
exit:

 li $v0, 10       # 10 means exit so next syscall program will exit. 
 syscall        # calls to the kernel - end of program

#

