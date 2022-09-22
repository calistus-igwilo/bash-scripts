#!/bin/bash

# Expansion.sh file will be called with arugments 
# it will display what the shell has passed to it after processing 
# all the arguments. Each of its arguments is printed on a separate 
# line, preceded by the value of $pre and followed by the value of $post

# The special parameter $@ expands to a list of all the command-line arguments, 
# but the results differ depending on whether it is quoted or not. When quoted, 
# it expands to the positional parameters "$1", "$2", "$3", "$4", and so on, and
# the arguments containing whitespace will be preserved. If $@ is unquoted, 
# splitting will occur wherever there is whitespace.

# expansion.sh script
pre=:
post=:
printf "$pre%s$post\n" "$@"

############################
##### Brace expansion #####
###########################
./expansion.sh {one,two,three}
# :one:
# :two:
# :three:

./expansion.sh {1..3}
# :1:
# :2:
# :3:

# A string before or after the brace expression will be included in each 
# expanded argument
./expansion.sh pre{d,l}ate
# :predate:
# :prelate:

# Braces may be nested
./expansion.sh {{1..3},{a..c}}
# :1:
# :2:
# :3:
# :a:
# :b:
# :c:

# Multiple braces within the same word are expanded recursively. 
# The first brace expression is expanded, and then each of the resulting words 
# is processed for the next brace expression. With the word {1..3} {a..c}, the 
# first term is expanded, giving the following:
# 1{a..c} 2{a..c} 3{a..c}

./expansion.sh {{1..3},{a..c}}
# :1a:
# :1b:
# :1c:
# :2a:
# :2b:
# :2c:
# :3a:
# :3b:
# :3c:

# In version 4 of bash, numerical sequences can be padded with zeros, and the increment in a sequence 
# can be specified:
./expansion.sh {01..13..3}
# :01:
# :04:
# :07:
# :10: 
# :13:

# Increments can also be used with alphabetic sequences:
./expansion.sh {a..h..3}
# :a:
# :d:
# :g:


##########################
#### Tilde Expansion ####
#########################

# An unquoted tilde expands to the user’s home directory:
./expansion.sh ~
# :/Users/calistus:

# Followed by a login name, it expands to that user’s home directory:
./expansion.sh ~root ~calistus
# :/var/root:
# :/Users/calistus: 

# When quoted, either on the command line or in a variable assignment, the 
# tilde is not expanded:
./expansion.sh "~" "~calistus"
# :~:
# :~calistus:

# If the name following the tilde is not a valid login name, no expansion is 
# performed:
./expansion.sh ~ebunilo
# :~ebunilo:

####################################
###### Process Substitution ########
####################################
# creates a temporary filename for a command or list of commands. You can use it 
# anywhere a file name is expected. The form <(command) makes the output of 
# command available as a file name; >(command) is a file name that can be written to

./expansion.sh <(ls -l) >(pr -Tn)
# :/dev/fd/63:
# :/dev/fd/62:

######################################
######### Parsing Options ############
#####################################

progname=${0##*/}  # get the name of the script without its path


######################################
######## Parameter Expansion #########
######################################
# ${var:-default} and ${var-default}: Use Default Values
var=
./expansion.sh "${var:-default}"  # if variable is unset or empty, it expands to a default string
# :defualt:

# if the colon is omitted, it checks only if it is unset
var=
./expansion.sh "${var-default}"  # the variable is set so it expands to nothing
# ::

unset var
./expansion.sh "${var-default}" # var is unset, so it expands to default
# :default:

# example below applies default value to $filename it is not supplied by an option
# or inherited in the environment
defaultfile=$HOME/.bashrc
## parse options here
filename=${filename:-"$defaultfile"}

# ${var:+alternate}, ${var+alternate}: Use Alternate Values
# substitutes an alternate value if the parameter is not empty or, without a colon, if it is set.
var=
./expansion.sh "${var:+alternate}"  # var is set but empty
# ::

var=value
./expansion.sh "${var:+alternate}" # var is not empty
# :alternate:

# without the colon, alternate is used if the variable is set, even if it is empty
var=
./expansion.sh "${var+alternate}"  # var is set
# :alternate:

unset var
./expansion.sh "${var+alternate}" # var is not set
# ::

var=value
./expansion.sh "${var:+alternate}" # var is set and not empty
# :alternate:


# ${#var}: Length of Variable’s Contents
# read passwd
if [ ${#passwd} -lt 8 ]
then
  printf "Password is too short: %d characters\n" "$#" >&2
exit 1 fi

# ${var%PATTERN}: Remove the Shortest Match from the End
var=Toronto
var=${var%o*}  # shortest matching parttern is the final o
echo $var # Toront

var=${var%o*}  # new shortest matching parttern from end is ont 
echo $var  # Tor

var=${var%0*}  # newest shortest matching pattern from end is or
echo $var  # T


# ${var%%PATTERN}: Remove the Longest Match from the End
var=Toronto
var=${var%%o*} # the longest matchin pattern from end is oronto
echo $var
# :T:

# ${var#PATTERN}: Remove the Shortest Match from the Beginning
var=Toronto
var=${var#*o} # shortest matching pattern from the beginning is To
echo $var 
# :ronto:

# ${var##PATTERN}: Remove the Longest Match from the Beginning
var=Toronto
var=${var##*o} # longest matching pattern from beginning is Toronto
echo $var  # empty
# :: 
#  Often used to extract the name of a script from the $0 parameter
scriptname=${0##*/} # /home/calistus/script  => script

# ${var//PATTERN/STRING}: Replace All Instances of PATTERN with STRING

# since ? matches any character, it can be used to hide password
passwd=zxQ1.=+-a
printf "%s\n" "${passwd//?/*}"
# *********

# ${var:OFFSET:LENGTH}: Return a Substring of $var
var=Toronto
./expansion "${var:3:2}"
# :on:

./expansion.sh "${var:3}"
# :onto:

# A negative OFFSET is counted from the end of the string. If a literal minus 
# sign is used (as opposed to one contained in a variable), it must be preceded 
# by a space to prevent it from being interpreted as a default expansion:
var=Toronto
./expansion.sh "${var: -3}"
# :nto:

# ${!var}: Indirect Reference
x=yes
a=x
./expansion.sh "${!a}"
# :yes:


