# File name: Project1.asm
# Name: William Nguyen
# Project 1

.text
.globl main
main: 
 # equation V = (nRT)/P
 # n is $s0
 # R is immediate 8314/1000
 # T is $s1
 # P is $s2
 # V is $s3
 
 
 # Prompt to enter n
 li $v0, 4
 la $a0, prompt1
 syscall
 
 # Read the integer and save it in $s0
 li $v0, 5
 syscall
 move $s0, $v0

 
 # Prompt to enter T
 li $v0, 4
 la $a0, prompt2
 syscall
 
 # Read the integer and save it in $s1
 li $v0, 5
 syscall
 move $s1, $v0
 
 # Prompt to enter P
 li $v0, 4
 la $a0, prompt3
 syscall
 
 # Read the integer and save it in $s2
 li $v0, 5
 syscall
 move $s2, $v0
 
 
 # Multiply
 mul $t0, $s0, $s1 # n*T
 
 addi $t1, $zero, 8314
 mul $t0, $t0, $t1 # (n*T)*8314
 
 #Divide
 addi $t1, $zero, 1000 # (8314*n*T)/1000
 div $t0, $t1
 mflo $t0
 
 div $t0, $s2 # (nRT)/P
 mflo $s3
 
 # print("The volume(V) is " V);
 addi $v0, $zero, 4 
 la $a0, result
 syscall
 addi $v0, $zero, 1 
 move $a0, $s3
 syscall 
 
 #End the program
 addi $v0, $zero, 10
 syscall
 
.data
prompt1: .asciiz "Please enter an integer value for amount of gas(n): "
prompt2: .asciiz "Please enter an integer value for temperature(T): "
prompt3: .asciiz "Please enter an integer value for pressure(P): "

result: .asciiz "The volume(V) is "
