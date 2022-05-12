#!/bin/bash
# Convert Giga to Mega
# the value to be converted must be passed to the script as argument 

GIGA=$1
MEGA=$(($GIGA * 1024))

echo "$GIGA GB is equal to $MEGA MB"
