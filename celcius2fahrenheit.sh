#!/bin/bash
# Convert Celcius to Fahrenheit
# The value to be converted must be passed to the script as argument
# The formula: F = C * (9/5) + 32
C=$1
F=$(echo "scale=2; $C * (9/5) + 32" | bc -l) #scale=2 keeps the resutl to 2 decimal places
echo "$C degrees Celcius is equal to $F degrees Fahrenheit."
