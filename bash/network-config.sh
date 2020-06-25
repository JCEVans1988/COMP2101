#!/bin/bash
#
# this script displays some host identification information for a simple Linux machine
#
# Sample output:
#   Hostname        : hostname
#   LAN Address     : 192.168.2.2
#   LAN Hostname    : host-name-from-hosts-file
#   External IP     : 1.2.3.4
#   External Name   : some.name.from.our.isp

# Task 1: Clean up this script by moving the commands that generate the output to separate lines
#         that put each command's output into variables. Once you have that done, Use those variables
#         in the output section at the end of the script. If the commands included in this script
#         don't make sense to you, feel free to create your own commands to find your ip addresses,
#         host names, etc.

# Task 2: Add variables for the default router's name and IP address.
#         Add a name for the router's IP address to your /etc/hosts file.
#         The router's name and address must be obtained by dynamically
#         finding the router IP address from the route table, and looking
#         up the router's hostname using its IP address, not by just
#         printing out literal text.
# sample of desired output:
#   Router Address  : 192.168.2.1
#   Router Hostname : router-name-from-hosts-file

# we use the hostname command to get our system name
# the LAN name is looked up using the LAN address in case it is different from the system name
# finding external information relies on curl being installed and relies on live internet connection
# awk is used to extract only the data we want displayed from the commands which produce extra data
# this command is ugly done this way, so generating the output data into variables is recommended to make the script more readable.
# e.g.
#   interface_name=$(ip a |awk '/: e/{gsub(/:/,"");print $2}')

# Creates the hostname variable and assigns the output from the hostname command
hostName=$(hostname)

# Uses a variable to store the ipaddress show command (that targets the ens33 interface), uses awk to search for the "inet" text and then
# specifies that the command needs to print the second column (the IP address). Afterwards, I use cut -d to specify that we are cutting everything
# after the / and to only use the first part.

lanIP=$(ip address show ens33 | awk '/inet /{print $2}' | cut -d/ -f1)

# Assigns to a variable the of the getent hosts command in conjunction with the lanIP variable. Then it tells bash to output the second column only.

localhostName=$(getent hosts $lanIP | awk '{print $2}')

# Creates a variable and assigns the output of the results taken from the transfer url command, in conjunction with the silent command.
externalIP=$(curl -s icanhazip.com)

# Creates a variable to capture output. The command is similar to the above example, but copies the name address of the site only via $externalIP and
# adds that information to the new variable.
externalName=$(getent hosts $externalIP | awk '{print $2}')

#Assigns to a variable the results of the ip route grep default command (looks up the default router IP) and specifically tells the program to output
# on the 3rd column only.

routerIP=$(ip route | grep default | awk '{print $3}')

# Assigns to a variable the results of the getent hosts command, using the routerIP variable. It then tells bash to output the second column only.

routerName=$(getent hosts $routerIP | awk '{print $2}')

# Utilizes the cat command and EOF function to feed both text and variables into the command line and then executes the acquired data with the final
# EOF command
cat <<EOF
Your host name is: $hostName
Your LAN address is: $lanIP
Your LAN hostname is: $localhostName
Your external IP is: $externalIP
Your external name is: $externalName
Your router IP is: $routerIP
Your router name is: $routerName
EOF
