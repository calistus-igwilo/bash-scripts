#!/bin/bash
# Convert Giga to Mega
# Pass the value to convert as an argument 

GIGA=$1
MEGA=$(($GIGA * 1024))

echo "$GIGA GB is equal to $MEGA MB"
