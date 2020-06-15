#!/bin/bash
#
# this script rolls a six-sided die
#

# Task: Improve this script by making it roll as many dice as there are letters in your first name, instead of just one

# roll the dice and display the result

# Creates the varname variable and assigns my name to it, then counts the letters and converts that to a number in the
# variable

varname="chris"
varname=${#varname}
count=0

# Calls for a while statement that uses the varname and count variables, and uses the less than argument. Tells the script to try the following and
# Display the output text, then adds one to the count and continues back to the top of the loop to execute again. Terminates when the count is equal to the
# count of the varname variable.

while [ $count -lt $varname ];
do
  echo "
  Rolling...
  $(( RANDOM % 6 + 1)) rolled
  "
  count=$(($count + 1 ))
  continue
done
