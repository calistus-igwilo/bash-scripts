#!/bin/bash

# Get the string lenght $(#string)
distros="Ubuntu"
echo ${#distros}

# Concatenate Strings
str1="Mr."
str2=" Robot"
str3=$str1$str2
echo $str3

# Append operator +=
var=abc
var+=def
echo "$var"
# abcdef



# Finding Substrings
# expr index string substr
str="Bash is Cool"
expr index "$str" "Cool"  # returns the index number of the 1st character of substring

# Extract Substring
# ${string:begin:end}
foss="Fedora is a free operating system"
echo ${foss:0:6} #extract  from the begining to index 6 (Fedora)
echo ${foss:12} #extract from index 12 to the end (free operating system)
echo ${foss:17:9} #extract from index 17 upto 9 characters after that (operating)

string="01234567890abcdefgh"
echo ${string: -7:2} # bc

# Replace Substrings
# ${string/old/new}
foss="Fedora is a free operating system"
echo ${foss/free/popular}

# Delete Substring
# ${string/substr}
fact="Sun is a big star, very big"
fact=${fact/big}  # deletes the first occurrence of "big"

cell="080-334-1712"
cell=${cell/-}  # removes the first occurence of substr
cell=${cell//-} # removes all occurrences of substr

# Convert to Uppercase and Lowercase Letters
legend="john nash"
actor="JULIA ROBERTS"

echo ${legend^^} # convert all to uppercase 
echo ${actor,,} # convert all to lowercase

echo ${legend^} # convert first letter to uppercase
echo ${legend,} # convert first letter to lowercase

echo ${legend^^[jn]} # convert all occurence of substr to uppercase

# Bash script to trim strings
# 1. Remove all astericks (*) in the string
# 2. Change all letters to uppercase
# 3. Output the updated string to the terminal

echo -n "Please enter a string: "  # -n do not print the trailing newline character
read str
str=`echo ${str//\*}`
str=`echo ${str^^}`
echo "Updated string: $str"

# check valid names
[!a-zA-Z_]*  # does not begin with a small letter, a capital letter or underscore
*[!a-zA-z0-9_]*  # does not contain a small letter, a capital letter or underscore

# Check whether a directory is included in the PATH variable:
if ! echo ${PATH} | grep -q /usr/games
then
  PATH=$PATH:/usr/games
fi

# compare lexical positions of string
str1="abc"
str2="def"
test str1 \< str2  # \ is used to escape < to avoid redirection
echo "exit status for str1 < str2: $?"

# Repeat Character to a Given Length
repeat_character()  
{
    #@ USAGE: repeat_character string number_of_times
    repeat=
    while (( ${#repeat} < $2 ))
    do
        repeat+=$1
    done 
}
# test the repeat_character function
repeat_character % 40
printf "%s\n" "$repeat"
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# repeat_character function can be sped up by concatenating more than one 
# instance in each loop so that the length increases geometrically. Then trim
# it down to desired length.
repeat_character2() {
    #@ USAGE: repeat_character string number_of_times
    repeat2=$1
    while (( ${#repeat} < $2 ))  # loop until string exceeds desired length
    do
        repeat2=$repeat2$repeat2$repeat2  
    done
    repeat2="${repeat2:0:$2}"  # trim to desired length
}
# test the repeat_character2 function
repeat_character2 % 40
printf "%s\n" "$repeat2"


# Print a warning message with a border and a beep
alert() {
    #@ USAGE: alert message border
    # it calls the repeat_character function
    repeat_character2 "${2:-#}" $(( ${#1} + 8 )) # adds 8 to the length of message
    printf '\a%s\n' "$repeat2"      # \a is BELL
    printf '%2.2s %s %2.2s\n' "$repeat2" "$1" "$repeat2"
    printf '%s\n' "$repeat2"
}

alert "double-check before you submit" "#"
######################################
## double-check before you submit ##
######################################


###############
# Test String #
###############
test "$a" = "$b"
[ "$q" != "$b" ]

# the -z and -n operators return successfully if their arguments
# are empy or nonempty
[ -z "" ]
echo $?     # 0

test -n ""
echo $1     # 1


