#!/bin/bash
# script to print the calendar of an entire year
echo -n "Please enter a year: "
read year
echo "Calendar of $year"
cal $year
