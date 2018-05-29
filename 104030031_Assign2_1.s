# Comment liberally!
 .data      #data directive - indicates the following data items are stored in the data segment
A: .word 10     #10 is the word - which is 32-bit value
B: .word 8
C: .word 0	#32bit values

message:
 .asciiz "The result of adding "    # asciiz stores the string in memory and null terminate it
  .text		# indicates the following items are stores in the user text segment such as instructions
main:
 lw $t0,A       #load word 10 into t0
 lw $t1,B       #do for b
 add $t2,$t0,$t1       # add 10 and 8 - how to subtract again
 sw $t2,C       #   store 18 to c
 
 # v0 Values for Function Results and Expression Evaluation
 li $v0,4       #   v0 results from callee,  4 means print_string so print the message
 la $a0,message       # display message
 syscall       #    calls to the kernel, or in this case the simulator, so it prints the message


 li $v0,1       #   v0 results from callee, 1 means print_int so printing the value of C 
 lw $a0,C       #   a0 is arguments to callee, display number 18 int
 syscall       #    calls to the kernel, system call OS like services - perform the task

  li $v0, 10       # v0 results from callee, 10 means exit so next syscall program will exit. 
 syscall        # calls to the kernel - end of program
#
#
