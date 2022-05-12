#!/bin/bash

# Addition and Subtraction
fs1=$(du -b $1 | cut -f1)
fs2=$(du -b $2 | cut -f1)

echo "File size of $1 is: $fs1 bytes"
echo "File size of $2 is: $fs2 bytes"

total=$(($fs1+$fs2))

echo "Total size is: $total bytes"

# Multiplication and Division
echo $((5 / 2))  #truncates the decimal part
echo "5/2" | bc -l #pass through the basic calculator to get the decimal portion

echo "4.1 - 0.5" | bc -l
