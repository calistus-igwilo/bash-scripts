#!/bin/bash

files=("f1.txt" "f2.txt" "f3.txt" "f4.txt" "f5.txt")

# print the elements of the array in reverse order
echo ${files[4]} ${files[3]} ${files[2]} ${files[1]} ${files[0]}

# print all the elements of the array
echo ${files[*]}

# print the total number of elements in the array
echo ${#files[@]}

# re-assing a value to an element
files[0]="a.txt"
echo ${files[*]}

# add element to array (add f6.txt to files)
files+=("f6.6xt")
echo ${files[*]}

# delete an element in the array (delete element in index 5)
unset files[5]
echo ${files[*]}

# delete the entire array
unset files
echo "array deleted ${files[*]}"

# Addition and Subtraction
fs1=$(du -b $1 | cut -f1)
fs2=$(du -b $2 | cut -f1)

echo "File size of $1 is: $fs1 bytes"
echo "File size of $2 is: $fs2 bytes"

total=$(($fs1+$fs2))

echo "Total size is: $total bytes"