#!/bin/bash
# This script demonstrates testing to see if 2 strings are the same
# it also demonstrates using conditional execution

# TASK 1: Improve it by asking the user for a password guess instead of using inline literal data (i.e. TestString)
# TASK 2: Improve it by rewriting it to use the if command
#         The if command should test if they got it right, in which case it should tell them they got it right
#         The if command should tell them they got it wrong
# TASK 3: Improve it by giving them 5 tries to get it right before failing
#           *** Do not use the exit command, and do not use a loop (e.g. while or for)

# Creates the two variables for both the correct password and the maximum number of uses
referenceString="password"
maximumUses=5

# Asks the user to enter a password, and utilizes the read command and assigns the input to the passWord variable
echo "Hello. Please enter the password for the password guesser program." ; read passWord

# Uses an if statement with the [ ] test condition to test the passWord and referenceString variables to see if they are the same, and tells the
# script what to output in the echo command if they got it right
if [ $passWord = $referenceString ]; then
  echo "Correct!"

# Else statement for if the user guessed incorrectly. Subtracts 1 from the maximumUses variable and tells the user the answer was incorrect.
else
  maximumUses=$(($maximumUses - 1))
  echo "Incorrect password. You have $maximumUses tries remaining." ; read passWord

# Ends the if statement
fi

# Everything that follows after this comment is a repeat of lines 21 through 30, until line 77 below.

if [ $passWord = $referenceString ]; then
  echo "Correct!"

elif [[ $passWord != "$referenceString" ]]; then

  maximumUses=$(($maximumUses - 1))
  echo "Incorrect password. You have $maximumUses tries remaining." ; read passWord

fi

if [ $passWord = $referenceString ]; then
  echo "Correct!"

elif [[ $passWord != "$referenceString" ]]; then

  maximumUses=$(($maximumUses - 1))
  echo "Incorrect password. You have $maximumUses tries remaining." ; read passWord

fi

if [ $passWord = $referenceString ]; then
  echo "Correct!"

elif [[ $passWord != "$referenceString" ]]; then

  maximumUses=$(($maximumUses - 1))
  echo "Incorrect password. You have $maximumUses tries remaining." ; read passWord

fi

if [ $passWord = $referenceString ]; then
  echo "Correct!"

elif [[ $passWord != "$referenceString" ]]; then

  maximumUses=$(($maximumUses - 1))
  echo "Incorrect password. You have $maximumUses tries remaining." ; read passWord

fi

if [ $passWord = $referenceString ]; then
  echo "Correct!"

# Final elif statement that checks whether the variables were not equal to one another and if so, moves on to check if the maximumUses is equal to 0.
elif [[ $passWord != "$referenceString" ]] && [[ $maximumUses = 0 ]]; then
  # Prints the final command informing the user that they no longer have any attempts remaining.
  echo "I'm sorry, you are out of uses. Shutting down..."
# ends the for statement
fi
