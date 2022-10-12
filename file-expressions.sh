#!/bin/bash
# test-file: Evaluate the status of a file
FILE=~/.bashrc
if [ -e "$FILE" ]; then
      if [ -f "$FILE" ]; then
            echo "$FILE is a regular file."
      fi
      if [ -d "$FILE" ]; then
            echo "$FILE is a directory."
      fi
      if [ -r "$FILE" ]; then
            echo "$FILE is readable."
      fi
      if [ -w "$FILE" ]; then
            echo "$FILE is writable."
      fi
      if [ -x "$FILE" ]; then
            echo "$FILE is executable/searchable."
      fi
      if [[ -s "$FILE" ]]; then
            echo "$FILE exists and is not empty"
      fi
else
      echo "$FILE does not exist"
      exit 1
fi 
exit

# Reading a File

# Contents of kjv.txt:

# Genesis:001:001:In the beginning God created the heaven and the earth.
# Exodus:020:013:Thou shalt not kill.
# Exodus:022:018:Thou shalt not suffer a witch to live.
# John:011:035:Jesus wept.

while IFS=: read book chapter verse text
do
  firstword=${text%% *}
  printf "%s %s:%s %s\n" "$book" "$chapter" "$verse" "$firstword"
done < "kjv.txt"
# Genesis 001:001 In
# Exodus 020:013 Thou
# Exodus 022:018 Thou


# cut
# The cut command extracts portions of a line, specified either by character or 
# by field
cut -c 22,24,26 "kjv.txt"     # -c cut by character
# ebg
# hl 
# hl 
# p.

cut -c -24 "kjv.txt"         # negative value copies from the end upto the number
# Genesis:001:001:In the b
# Exodus:020:013:Thou shal
# Exodus:022:018:Thou shal
# John:011:035:Jesus wept.