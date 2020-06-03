#!/bin/bash
#
# this script generates a report of the files on the system that have the setuid permission bit turned on
# it is for the lab1 exercise
# it uses the find command to find files of the right type and with the right permissions, and an error redirect to
# /dev/null so we do not get errors for inaccessible directories and files
# the identified files are sorted by their owner

# Task 1 for the exercise is to modify it to also find and display the setgid files in a second listing
# The second listing should display after the setuid file list, and be formatted similar to the
# setuid file list including having a title
# use the find command to find files of the right type and with the right permissions, and an error redirect to
# /dev/null so we do not get errors for inaccessible directories and files
# the identified files should be sorted by their group

# Task 2 for the exercise is to modify it to also display the 10 largest regular files in the system, sorted by their sizes
# The listing should only have the file name, owner, and size in MBytes and be displayed after the listings of
# setuid and setgid files and should have its own title
# use the find command to generate the list of files with their sizes, with an error redirect to /dev/null
# use cut or awk to display only the output desired

echo "Setuid files:"
echo "============="
find / -type f -executable -perm -4000 -ls 2>/dev/null | sort -k 3
echo ""

echo "Setgid files:"
echo "============="
find / -type f -executable -perm -2000 -ls 2>/dev/null | sort -k 3
echo ""

echo "Scanning for largest files. Please wait..."
echo "============="
find / -type f -exec ls -l --block-size=M {} + 2>/dev/null | sort -rh -k 5 | head | awk '{$1=$2=$4=$6=$7=$8="";print $0}'
echo ""

# -type f: find regular files. -exec: execute the following code for every file found. ls after -exec: execute ls

# -l: long list, --block-size=M: variable command to show block size. {} + : Insert name here, for every file

#2>dev/null: error checking, ignores errors. sort -rh -k 5(recursive human friendly sort of fifth colum)

# head (list from the top to bottom). awk ''{$1=$2=$4=$6=$7=$8="";print $0}': Look at every column except 3rd and 5th,
# and insert a blank space in its stead. ; = next command. print $0}' : print everything

# ANOTHER INSTANCE OF HOW TO DO THIS

# sudo find / -type f -printf '%k %u %p\n' 2>/dev/null | awk '{$1=int($1/1024) "Mb"; print $0}' | sort -hr | head

#-printf: print format. '%k: size, %u: username, #p: name of file. \n: Take new input and put it on new line

# awk '{$1=int($1/1024}: take column one, and divide it by 1024 and then turn into an integer.

# "Mb" : what to print beside the output. ; print $0}': print every column now. sort -hr (recursive human friendly)

# head (print from top to bottom)
