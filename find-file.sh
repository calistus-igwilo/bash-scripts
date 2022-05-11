#!/bin/bash
# A script to find any file on a linux-based machine

find / -iname $1 2> /dev/null #redirect any error to the null file
