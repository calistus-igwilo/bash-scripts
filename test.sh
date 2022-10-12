#!/bin/bash
  #typeset -a data=("$@")
  # Write your code here
  cnt=0
  my_array=("Akwa" 'udo' 'Mmiri' 'John')
  for value in "${my_array[@]}" 
  do
    if [[ "$value" =~ [A-Z] ]]; then
        cnt=$((cnt+1))
    fi
   done
echo $cnt