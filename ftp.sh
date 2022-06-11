#!/bin/bash
# Script to retrieve a file via FTP
FTP_SERVER=ftp.nl.debian.org FTP_PATH=/debian/dists/stretch/main/installer-
amd64/current/images/cdrom REMOTE_FILE=debian-cd_info.tar.gz
ftp -n << _EOF_
open $FTP_SERVER
user anonymous me@linuxbox
cd $FTP_PATH
hash
get $REMOTE_FILE
bye
_EOF_
ls -l "$REMOTE_FILE"