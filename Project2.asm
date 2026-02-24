# File name: Project2.asm
# Name: William Nguyen
# Project 2 Extra Credit

.text
.globl main
main: 
 # N8 is $s0
 # P is $s1
 # N10 is $s2
 # R is $s3
 # K is $s4
 # N5 is $s5
 # A is $s6

 
 # Prompt to enter number in base 8
 li $v0, 4
 la $a0, prompt
 syscall
 
 # Read the integer and save it in $s0
 li $v0, 5
 syscall
 move $s0, $v0 # N8
 
 # initialize variables
 li $s1, 1 # P
 li $s2, 0 # N10
 li $t0, 0 # constant 0

 # Begin While loop1
 loop1:
 beq $s0, $t0, end1 # while N8 =/= 0
 
 addi $t1, $zero, 10
 div $t1, $s0, $t1 # N8 / 10
 mfhi $s3 # R
 
 sub $s0, $s0, $s3 # N8 = N8 - R
 
 addi $t1, $zero, 10
 div $s0, $t1
 mflo $s0 # N8 = N8 / 10
 
 mul $t2, $s3, $s1 # R*P
 add $s2, $s2, $t2 # N10 = N10 + R*P
 
 addi $t3, $zero, 8 # constant 8
 mul $s1, $s1, $t3 # P = P*8
 
 j	loop1 # jump back to the top
 end1: # end loop
 
 
 # Initialize variables
 li $s4, 1 # K
 li $s5, 0 # N5
 li $t0, 0 # constant 0
 
 # Begin While loop2
 loop2:
 beq $s2, $t0, end2 # while N10 =/= 0
 
 addi $t1, $zero, 5
 div $t1, $s2, $t1 # N10 / 5
 mfhi $s6 # A
 
 mul $t2, $s6, $s4 # A*K
 add $s5, $s5, $t2 # N5 = N5 + A*K
 
 addi $t1, $zero, 5
 div $s2, $t1
 mflo $s2 # N10 = N10 / 5
 
 addi $t3, $zero, 10 # constant 10
 mul $s4, $s4, $t3 # K = K*10
 
 j	loop2
 end2: # end loop
 
 # print the number in base 5;
 addi $v0, $zero, 4 
 la $a0, result
 syscall
 addi $v0, $zero, 1 
 move $a0, $s5
 syscall 
 
 #End the program
 addi $v0, $zero, 10
 syscall
 
.data
prompt: .asciiz "Please enter a number in base 8: "

result: .asciiz "Your number in base 5 is "