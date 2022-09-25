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

# get all the values of BASH_VERSINFO array
./extension.sh "${BASH_VERSINFO[*]}"
# 3 2 57 1 release x86_64-apple-darwin21

# get the length of element in the 5th index
./extension.sh "${BASH_VERSINFO[5]}"
# :21:

# get the 2nd and 3rd elements in BASH_VERSINFO array
echo ${BASH_VERSINFO[@]:1:2}
# 2 57

# Holes in Indexed Array
array=( a b c d e f g h i j )
unset array[2] array[4] array[6] array[8]
./extension.sh "${array[@]}"
# :a:
# :b:
# :d:
# :f:
# :h:
# :j:

# With a sparse (or any) array, the ${!array[@]} expansion lists the subscripts:
./extension.sh "${!array[@]}"
# :0:
# :1:
# :3:
# :5:
# :7:
# :9:

# to remove the holes
array=( "${array[@]}" )     # converts associative array into an indexed array
echo "${!array[@]}"
# 0 1 2 3 4 5 




