#!/bin/bash
# Create users from a list of names stored in CSV file
# Add each user to "developers" group which was created prior to running the script
# Create .ssh directory for each user and add public key to authorized_keys

names=$(cat inventory.csv)

for i in $names; do
    # create user if it does not exist
    sudo egrep "^$i" /etc/passwd &>/dev/null
    if [ $? -eq 0 ]; then
        echo "$i already exists"
    else
        sudo useradd -m $i &>/dev/null &&
        sudo usermod -aG developers $i
        echo "User $i created and added to develpers group"   
    fi

    # add authorized keys
    sudo egrep "^$i" /etc/passwd &>/dev/null
    if [ $? -eq 0 ]; then
        echo "$i's .ssh directory already exists"
    else 
        sudo mkdir /home/$i/.ssh &>/dev/null
        #sudo cp authorized_keys /home/$i/.ssh/ &>/dev/null
        echo "..ssh directory and keys added for $i"
    fi
done 