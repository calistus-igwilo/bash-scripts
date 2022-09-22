#!/bin/bash

is_valid_ip() {
    case $1 in
        ## reject the following:
        ##   empty string
        ##   anything other than digits and dots
        ##   anything not ending in a digit
        "" | *[!0-9.]* | *[!0-9]) return 1 ;;
    esac

    # Change the Internal Field Separator (IFS) to a dot, but only in this
    # function
    local IFS=.

    # Place the IP address into the postional parameters; after word splitting,
    # each element becomes a parameter
    set -- $1

    [ $# -eq 4 ] &&  # must be four parameters
                        # each must be less than 256
    # A default of 666 (which is invalid) is used if a parameter is empty
    # All four parameters must pass the test
    [ ${1:-666} -le 255 ] && [ ${2:-666} -le 255 ] && 
    [ ${3:-666} -le 255 ] && [ ${4:-666} -le 255 ]
}

for ip in 127.0.0.1 168.260.0.234 1.2.3.4 123.100.34.21 204.225.122.150
do
    if is_valid_ip "$ip"
    then
        printf "%15s: Valid\n" "$ip"
    else
        printf "%15s: Invalid\n" "$ip"
    fi
done


# Check valid integer
is_valid_integer() {
    case ${1#-} in      # Remove any leading hyphen to accept negative numberss
    *[!0-9]*) false;;   # the string contains a non-digit character
    *) true ;;
    esac
}

#Set Different Exit Codes
range_check() #@ USAGE: range_check int [lo [high]]
    if [ "$1" -lt ${2:-10} ]
    then 
        return 1
    elif [ "$1" -gt ${3:-20} ]
    then 
        return 2
    else 
        return 0
    fi 
#Return codes are a single, unsigned byte; therefore, their range is 0 to 255.

