# File name: Project4.asm
# Name: William Nguyen
# Project 4
# This program prints every other capital letter of the alphabet, starting with A.

.text
.globl main
main:

 ori $v0, $zero, 4
 li 	$t0, 0x59		# t0 is a constant 0x59 (or 'Y')
 ori $t1, $zero, 0x41 		# Load the character "A" as i
 move $a0, $t1
 ori $v0, $zero, 11		# Print "A"
 syscall
 
 loop:		# for loop
 beq $t1, $t0, end 	# if i == 0x59 (or 'Y') we are done
 
 li $a0, 0x20		
 ori $v0, $zero, 11	# Print the space
 syscall
 
 addi $t1, $t1, 0x02	# Change to other letter of alphabet
 
 move $a0, $t1		# Move the letter into $a0
 ori $v0, $zero, 11	# Print the character
 syscall
 
 j	loop	# jump back to the top
 end:
 
 ori $v0, $zero, 10 # Exit program
 syscall
