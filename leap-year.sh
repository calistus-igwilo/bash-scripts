#!/bin/bash
# Script to determine whether or not a year is a leap year
# A year is a leap year if it satifies the following conditions:
# 1. Year is a multiple of 400
# 2. Year is a multiple of 4 and not multiple of 100

year=$1

if [ $(($year % 400)) -eq 0 ]; then
    echo "$year is a leap year."
elif [ $(($year % 4)) -eq 0 ] && [ $(($year % 100)) -ne 0 ]; then
    echo "$year is a leap year."
else
    echo "$year is not a leap year."
fi