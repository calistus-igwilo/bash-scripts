#!/bin/bash
# converts the contents of a file to uppercase
# the file path must be passed to the script as argument

echo "Displaying Content of $1 in upper case."
cat $1 | tr [:lower:] [:upper:]