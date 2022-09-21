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

pre=:
post=:
printf "$pre%s$post\n" "$@"

# Brace expansion


