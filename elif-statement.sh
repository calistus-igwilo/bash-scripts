#!/bin/bash
# elif statment

AGE=$1  # age should be passed to script as an argument

if [ $AGE -lt 13 ]; then
    echo "You are a kid"
elif [ $AGE -lt 20 ]; then
    echo "You are a teenager"
elif [ $AGE -lt 65 ]; then
    echo "You are an adult"
else
    echo "You are an elder"
fi