#!/bin/bash
# This script demonstrates how the shift command works

# create an empty array to put the command line arguments into
myargs=()
# loop through the command line arguments

# Creates four variables for later conditional use and sets them appropriately. Refer to the variable for what text is entered.
debugMode="off"
Nexit="no"
Nvalue=""
verboseMode="off"

# Uses a while statement with square brackets to create a test command, takes the success of the previous command ($#) and tests to see if it was
# greater than a zero (indicating failure). Gives instruction on what to do next with the semi-colon and the 'do' statement.
while [ $# -gt 0 ]; do
  # tell the user how many things are left on the command line
  echo "There are $# things left to process on the command line."
  # add whatever is in $1 to the myargs array
  myargs+=("$1")

# issues the case command and uses the $1 variable as the thing to search within
case $1 in

  # the following single letters entries that are accompanied by a dash are what the scripts searches for in the $myargs variable
  -h)

    # If the user types the help command, the program will explain how to use this program and explain how to avoid errors. Also explains commands.
    echo "You typed the 'help' command. Please enter some text after the cmdargs.sh entry (such as, 'dog', 'cat', 'fish', etc) to feed text into the
    program. Be sure to include spaces as to prevent bash from getting confused. You may also type '-v' for the verbose command, and '-d' (along with
    a space and single digit number afterwards) to enter into the debug mode. Be sure to include the single digit number; otherwise you will
    be prompted again to do so."

    # exits the program, and the ;; statement indicates that the testing for this string is done.
    exit
    ;;

  -v)

    # informs the user that the verbose command is active
    echo "You entered the 'verbose command'. Setting verbose mode to: 'on'"
    # activates the verboseMode variable and sets it to "on"
    verboseMode="on"
    ;;

  -d)
    # Takes the empty Nvalue variable and assigns the output of the $2 variable, shifts afterwards to clear the queue so that it doesn't get stuck
    # on $2
    Nvalue="$2"
    shift

    # If statement that takes the $Nvalue variable, tests it to see if there are any numbers from 0-9, and if true, proceeds to the next command

    # The double square brackets allow for extended methods of testing, like the =~ test. The =~ test means search the data on the left
    # for the regular expression on the right. If the expression is matched anywhere in the data on the left, then the test is true.
    # The regular expression [0-9]  means match exactly one and not less than one character, and the character must be a digit from 1 to 9, inclusive.
    # The regular expression [0-9]* means match 0 or more of the expression [0-9]. The ^ symbol in a regular expression means the patterm must be at
    # the start of a line of text. The $ symbol in a regular expression means the pattern must be at the end of a line of text.

    if [[ "$Nvalue" =~ ^[1-9][0-9]*$ ]]; then

      # Tell the user they have successfully turned on the debug mode and what the Nvalue is.
      echo "You have entered the debug command and specified the N value as: $Nvalue. Setting Debug value to: 'yes'."
      debugMode="yes"

      continue

    # If the user does enter a valid entry...
    else

        # Prompts the user to correct their previous entry. Exits the program.
        echo "I'm sorry. You didn't enter a single digit number after the -d command. Please amend your entry and try again. Example: -d 2 ."
        exit

        # ends the current if statement inside of the while loop
      fi
      # Ends the while loop
      ;;

    # If any other input is entered, then end the case command and proceed as normal.
    * )
      ;;
  esac

  # tell the user what we did
      echo "Added \'$1\' to the arguments array"

# TASK 1: instead of just adding arguments to an array, use a case statement to recognize some options
#          Options to recognize: -h for help, -v for verbose mode, -d N for debug mode with N being a single digit number
#          If the help option is recognized, print out help for the command and exit
#          If the verbose option is recognized, set a variable to indicate verbose mode is on
#          If the debug optionis recognized, set a variable with the debug level from the number given after the -d on the command line
#             display an error if the user gave the -d option without a single digit number after it
#          Anything that wasn't recognized on the command line should still go into the myargs array

  # each time through the loop, shift the arguments left
  # this decrements the argument count for us
  shift
  # tell the user we shifted things
  echo "Shifted command line, leaving $# things left to process."
  echo "--------------------------"
  # go back to the top of the loop to see if anything is left to work on
done
echo "Done"

# This command uses an if statement and test $Nvalue to see if it is blank. If it is, then it will change the variable to include the "empty" text.
if [ "$Nvalue" = "" ]; then
  Nvalue="empty"

# ends the if statement
fi

# Displays the text show the results of the script using variables to show what is active and not active. Also contains ${myargs[@]}, which
# shows all the array elements that have been captured. Done so that it does not produce a single entry only.
cat<<EOF

-Your verbose mode is $verboseMode
-Your debug mode is $debugMode and your debug value is "$Nvalue"
-Your myvargs array contains the following information: "${myargs[@]}"

EOF

# TASK2: display the settings and myargs contents
#         Tell the user if vebose mode is on
#         Tell the user if debug mode is on and if it is, what number it is set to
#         Print out the myargs array with a label
