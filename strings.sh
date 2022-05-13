#!/bin/bash

# Get the string lenght $(#string)
distros="Ubuntu"
echo ${#distros}

# Concatenate Strings
str1="Mr."
str2=" Robot"
str3=$str1$str2
echo $str3

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

# Replace Substrings
# ${string/old/new}
foss="Fedora is a free operating system"
echo ${foss/free/popular}

# Delete Substring
# ${string/substr}
fact="Sun is a big star"
fact=${fact/big}

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
echo "Please enter a string: "
read 
