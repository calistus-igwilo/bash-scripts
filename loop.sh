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