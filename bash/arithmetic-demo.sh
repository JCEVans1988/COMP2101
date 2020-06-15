#!/bin/bash
#
# this script demonstrates doing arithmetic

# Task 1: Remove the assignments of numbers to the first and second number variables. Use one or more read commands to get 3 numbers from the user.
# Task 2: Change the output to only show:
#    the sum of the 3 numbers with a label
#    the product of the 3 numbers with a label

# Echo prompts tell the user what the program will do and provides instruction on how to use the program.
echo "Hello. We will be doing some math today! I need you to enter some numbers.";
echo "Please do not enter a 0. Otherwise your multiplication will result in a big fat zero."

# Asks the user for input and then records them into various variables for later use.
echo "Enter your three numbers please."
read firstNum;read secondNum;read thirdNum

#Tells the user what they entered. Testing purposes.
echo "Thank you. You entered $firstNum, $secondNum, and $thirdNum"

# Prints out the totals via echo command, and does the necessary math via the double brackets using the variables
# in question

echo "Your sum total: $(($firstNum + $secondNum + $thirdNum))"
echo "Your product total: $(($firstNum * $secondNum * $thirdNum))"

# Thanks the user for using the program

echo "Thank you for using the program. Have a good day!"
