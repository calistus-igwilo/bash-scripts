#!/bin/bash
# Create users from a list of names stored in an inventory file
# each name is on a line

names=$(cat inventory.csv)

for i in $names; do
    # create user if it does not exist
    if [ id -u $names >/dev/null 2>&1 ]; then
        echo "$names exist"
    else
        sudo useradd -m $i    
    fi

    # add authorized keys
    if [ sudo -d /home/$i/.ssh >/dev/null 2>&1 ]; then
        echo ".ssh directory exists"
    else 
        sudo mkdir /home/$i/.ssh
        sudo cp authorized_keys /home/$i/.ssh/
    fi
done 