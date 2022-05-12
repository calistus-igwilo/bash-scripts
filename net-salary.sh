#!/bin/bash
# Calculate the net salary of an employee

echo "Enter your monthly gross slaray: "
read msal
echo "Please enter your tax rate (in percentage): "
read tax

gross=$(echo "$msal*12" | bc -l)
net=$(echo "scale=2; $gross - $tax/100*$gross" | bc -l)

echo "Your total net annual salary is: $net"