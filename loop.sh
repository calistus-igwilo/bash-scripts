#!/bin/bash

# C-Style Loop
for ((i=0;i<10;i++)); do
    echo "Hello, Friend $i"
done

# List/Range-Style loop
for i in {0..9}; do
    echo "Hello, Friend$i"
done 

# Iterate through a list of files
for i in /var/*; do
    echo $i 
done 

# While Loops
# while [ condition ]; do
#     [commands]
# done

num=1
while [ $num -le 10 ]; do
    echo $(($num * 3))
    num=$(($num+1))
done

# Until Loops
# until [ condition ]; do
#    [commands]
# done

num=1
until [ $num -gt 10 ]; do  # It evaluates as long as condition is false. It is the oppostie of while loop
    echo $(($num * 3))
    num=$(($num+1))

# Traverse Array
prime=(2 3 5 7 11 15 17 19 23 29)
for i in "${prime[@]}"; do
   echo $i 
done

