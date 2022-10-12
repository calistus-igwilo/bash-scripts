#!/bin/bash
echo "The name of the script: $0"
echo "The number of arguments passed to the script: $#"
echo "The values of all arguments passed to the script: $@ or $*"
echo "The process ID of current shell: $$"
echo "The last argument to the command $_"
[ 1 -gt 2 ]
echo "The exit code of the last executed command $?"