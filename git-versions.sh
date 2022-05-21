#!/bin/bash
# script to get all git versions from official git-scm website

# check if wget is installed
which wget &>/dev/null
if [ $? -ne 0 ]; then
  echo "please install wget and retry"
  exit 1
fi 

# remove old index.html file if it exists
if [ -e "index.html" ]; then
  echo "Removing old index.html"
  rm -rf index.html 
fi 

url="https://mirrors.edge.kernel.org/pub/software/scm/git/"
wget $url
if [ $? -ne 0 ]; then 
  echo "Unable to download git info from $url"
  exit 2
fi 

declare -a git_vers #declare an arrary called git_vers to hold the versions
echo "********* Collecting all git versions from git website. Please wait."
while read line
do 
  git_vers+=($(echo $line | sed -n '/git-\([0-9]\+\.\)\+tar.gz/p' | awk -F '"' '{ print $2 }' | cut -c 5- | awk -F '.tar.gz' '{print $1}'))
done < index.html

echo "All available git versions are: "
cnt=0
no_vers=${#git_vers[*]}
WIDTH=10
for each_ver in ${git_vers[*]}
do 
  printf "%-*s %-*s %-*s %-*s %-*s\n" $WIDTH ${git_vers[$cnt]} $WIDTH ${git_vers[$((cnt+1))]} $WIDTH ${git_vers[$((cnt+2))]} $WIDTH ${git_vers[$((cnt+3))]} $WIDTH ${git_vers[$((cnt+4))]}
  cnt=$((cnt+5))
  if [ $cnt -ge $no_vers ]; then
    break
  fi 
done
