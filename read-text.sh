#!/bin/bash

names=$(cat inventory.txt)

for i in $names; do
    echo $i 
done 