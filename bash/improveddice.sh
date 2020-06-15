#!/bin/bash
#
# this script rolls a pair of six-sided dice and displays both the rolls
#

# Task 1:
#  put the number of sides in a variable which is used as the range for the random number
#  put the bias, or minimum value for the generated number in another variable
#  roll the dice using the variables for the range and bias i.e. RANDOM % range + bias

# Task 2:
#  generate the sum of the dice
#  generate the average of the dice

#  display a summary of what was rolled, and what the results of your arithmetic were

# Creates two variables and assigns values from the previous script.
diceSides=6
minRoll=1

# Tell the user we have started processing
echo "Rolling..."
# roll the dice and save the results

die1=$(( RANDOM % $diceSides + $minRoll))
die2=$(( RANDOM % $diceSides + $minRoll))
# display the results
echo "Rolled $die1, $die2"

# Does the required math that creates the sum and average totals, by adding or dividing the two variable as needed.
diceSum=$(($die1 + $die2))
diceAverage=$(($diceSum / 2))
diceMod=$(($diceSum % 2))
echo "The sum of the dice rolls is $diceSum"

# Informs the user what the modulus is. For testing purposes.
echo "The modulus is $diceMod"

# If and else statements to allow the script to check the modulus and then append the results if a decimal would result.
# -eq means equal to, and 0 is obvious

if [ $diceMod -eq 0 ]; then echo "The average of the dice rolls is $diceAverage"

else echo "The average of the dice rolls is ${diceAverage}.5"

# Tells the if loop to end.
fi
