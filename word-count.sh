#!/bin/bash
# Count the number of lines in a file
# Other options could be: 
# -w for number of words, 
# -m for no. of characters

nlines=$(wc -l < $1)
echo "There are $nlines lines in $1"
