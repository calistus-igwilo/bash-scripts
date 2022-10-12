#!/bin/bash

# Instructions
# Two-fer or 2-fer is short for two for one. One for you and one for me.

# Given a name, return a string with the message:

# One for name, one for me.
# Where "name" is the given name.

# However, if the name is missing, return the string:

# One for you, one for me.


two_fer() {
    name="$1"
    echo "One for ${name:-you}, one for me"
}

two_fer "$@"
