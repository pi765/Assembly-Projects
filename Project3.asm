# File:	Project3.asm
# Purpose:	To define utilities which will be used in MIPS programs.
# Author:	Charles Kann
# Author: 	William Nguyen
# 
# Title to and ownership of all intellectual property rights 
# in this file are the exclusive property of Charles W. Kann.
#
# Subprograms Index:
#   Exit 		Call syscall with a server 10 to exit the program
#   PrintNewLine	Print a new line character (\n) to the console
#   PrintInt		Print a string with an integer to the console
#   PrintString		Print a string to the console
#   PromptInt		Prompt for an int & return it to the calling program.
#
# Project 3 Subprograms
#   NOT			take one input parameter and return the NOT operation on that parameter
#   Mult4		take an input parameter and return that parameter multiplied by 4
#   LeftCircularShift	take an input parameter and return two values. The first is the value that has been shifted 1 bit 
#			using a left circular shift and the second is the value of the bit which has been shifted
#   ToLower		take a string and convert from uppercase to lowercase, and do nothing if it's already lowercase

# Modification History
#     12/27/2014 - Initial release

# Subprogram:	Exit
# Author:  	Charles Kann
# Purpose:	to use syscall service 10 to exit a program
# Input/Output:	None
# Side effects:	The program is exited

.text
Exit:
    li $v0, 10
    syscall

# Subprogram:	PrintNewLine
# Author:  	Charles Kann
# Purpose:	to output a new line to the user console
# Input/Output:	None
# Side effects:	A new line character is printed to the user's console

.text
PrintNewLine:
    li $v0, 4
    la $a0, __PNL_newline
    syscall 
    jr $ra

.data
   __PNL_newline:   .asciiz "\n"


# Subprogram: 	PrintInt
# Author:	Charles W. Kann
# Purpose:	To print a string to the console
# Input:	$a0 - The address of the string to print.
#		$a1 - The value of the int to print
# Output:	None
# Side effects:	The String is printed followed by the integer value.

.text
PrintInt: 
    # Print string.  The string address is already in $a0
    li $v0, 4
    syscall
    
    # Print integer.   The integer value is in $a1, and must
    # be first moved to $a0.
    move $a0, $a1
    li $v0, 1
    syscall
    
    #Return
    jr $ra


# Subprogram: 	PrintString
# Author:	Charles W. Kann
# Purpose:	To print a string to the console
# Input:	$a0 - The address of the string to print.
# Output:	None
# Side effects:	The String is printed to the console.

.text
PrintString: 
    addi $v0, $zero, 4
    syscall
    jr $ra


# Subprogram: 	PromptInt
# Author:	Charles W. Kann
# Purpose:	To print the user for an integer input, and
#               to return that input value to the caller.
# Input:	$a0 - The address of the string to print.
# Output:	$v0 - The value the user entered
# Side effects:	The String is printed followed by the integer value.

.text
PromptInt: 
    # Print the prompt, which is already in $a0
    li $v0, 4
    syscall
    
    # Read the integer.  Note: at the end of the syscall the value is
    # already in $v0, so there is no need to move it anywhere.
    move $a0, $a1
    li $v0, 5
    syscall

    #Return
    jr $ra

# Project 3 Subprograms

#Subprogram:	Mult4
#Author:	William Nguyen
#Purpose:	Multiply an input by 4
#Input:		$a0 - The value to multiply
#Output:	$a1 - The value multiplied

.text
Mult4:	
	#Shift left logical 2 bits (multiply by 4)
	sll $a1, $a0, 2 
	
	#Return
	jr $ra


#Subprogram:	NOT
#Author:	William Nguyen
#Purpose:	takes one input parameter and return the NOT operation (bit inversion) on that parameter
#Input:		$a0
#Output:	$a1

.text
NOT:
	#not operator
	nor $a1, $a0, $zero
	
	#Return
	jr $ra

#Subprogram:	LeftCircularShift
#Author:	William Nguyen
#Purpose:	take an input parameter and return two values. 
#		The first is the value that has been shifted 1 bit using a left circular shift and the second is the value
# 		of the bit which has been shifted (this can be the least significant bit in a register, the other 31 bits should be 0).
#Input:		$a0
#Output:	$a1 - value shifted 1 using a left circular shift
#		$a2 - value of the bit which has been shifted

.text
LeftCircularShift:
	#rol psuedo-operator translated to real instruction
	srl $at, $a0, 1
	sll $a1, $a0, 1
	or $a2, $a1, $at
	
	#Return
	jr $ra
	
# Subprogram:	ToLower
# Author:	William Nguyen
# Purpose:	take a 32-bit input which is 3 characters and a null or a 3-character string. 
#		Convert the 3 characters to lower case if they are upper case or do nothing if they are already lower case.
# Input:	$a0
# Output:	$a1

.text
ToLower:
	#Convert character to lower case
	li $v0, 8
	ori $a1, $a0, 0x20

	#Return
	jr $ra
	
