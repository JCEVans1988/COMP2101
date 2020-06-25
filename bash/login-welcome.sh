#!/bin/bash
#
# This script produces a dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Task 1: Use the variable $USER instead of the myname variable to get your name
# Task 2: Dynamically generate the value for your hostname variable using the hostname command - e.g. $(hostname)
# Task 3: Add the time and day of the week to the welcome message using the format shown below
#   Use a format like this:
#   It is weekday at HH:MM AM.
# Task 4: Set the title using the day of the week
#   e.g. On Monday it might be Optimist, Tuesday might be Realist, Wednesday might be Pessimist, etc.
#   You will need multiple tests to set a title
#   Invent your own titles, do not use the ones from this example

###############
# Variables   #
###############

# Creates variables for title and hostname
title="Overlord"
hostname=$(hostname)

###############
# Main        #
###############

# Creates the myday variable to store the day in. Done to reduce the amount of calculations in the if statements
myday=$(date +%A)

# if statements that examine the $myday variable and produce the appropriate text when a match is found.

if [ "$myday" = "Monday" ]; then
  title="Grumpy leader"

elif [ "$myday" = "Tuesday" ]; then
  title="Strung out leader"

elif [ "$myday" = "Wednesday" ]; then
  title="Punished leader"

elif [ "$myday" = "Thursday" ]; then
  title="Worn out leader"

elif [ "$myday" = "Friday" ]; then
  title="TGIF leader"

elif [ "$myday" = "Saturday" ]; then
  title="Weekend warrior"

elif [ "$myday" = "Sunday" ]; then
  title="Reluctant leader"

# Else statement for otherworldly users. Done to prevent program crashing in bizarre situations
else
  echo " '$myday' is not a recognized day in a seven day calender, cosmic traveller. Try again when your days match ours."

# ends the if loop
fi

# Assigns the current day, hour, minute, and whether or not it is AM or PM
mydate=$(date +"%A at %H:%M%p")

# Export command with variable that takes the above text and assigns it to the environmental variable
export WELCOME="Welcome to planet $hostname, $title $USER! It is $mydate"

# Simple echo command for debugging the $WELCOME variable and ensuring the export command is working properly.
echo $WELCOME

# call the cowsay command and feed the $WELCOME variable into it. If successful, the program ends.

cowsay $WELCOME && exit

# if the previous command failed ($? output is greater than 0), then...
if [ $? -gt 0 ]; then

  # Echo command tells the user cowsay is not installed, and initiates an install and tries again. If it fails, terminate the program with an
  # unsuccessful exit
  echo "cowsay is not installed. Installing cowsay..."; sudo apt install cowsay; cowsay $WELCOME || exit 1

# fi statement ends the if loop.
fi
