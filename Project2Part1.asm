# File name: Project2Part1.asm
# Name: William Nguyen
# Project 2 Part 1

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
 la $a0, prompt1
 syscall
 
 # Read the integer and save it in $s0
 li $v0, 5
 syscall
 move $s0, $v0 # N8
 
 # initialize variables
 li $s1, 1 # P
 li $s2, 0 # N10
 li $t0, 0 # constant 0

 # Begin While loop
 loop1:
 beq $s0, $t0, end # while N8 =/= 0
 
 addi $t1, $zero, 10
 div $t1, $s0, $t1 # N8 /10
 mfhi $s3 # R
 
 sub $s0, $s0, $s3 # N8 = N8 - R
 
 addi $t1, $zero, 10
 div $s0, $t4
 mflo $s0 # N8 = N8 / 10
 
 mul $t2, $s3, $s1 # R*P
 add $s2, $s2, $t2 # N10 = N10 + R*P
 
 addi $t3, $zero, 8 # constant 8
 mul $s1, $s1, $t3 # P = P*8
 
 j	loop1 # jump back to the top
 end:

 # print the number in base 10;
 addi $v0, $zero, 4 
 la $a0, result
 syscall
 addi $v0, $zero, 1 
 move $a0, $s2
 syscall 
 
 #End the program
 addi $v0, $zero, 10
 syscall
 
.data
prompt1: .asciiz "Please enter a number in base 8: "

result: .asciiz "Your number in base 10 is: "