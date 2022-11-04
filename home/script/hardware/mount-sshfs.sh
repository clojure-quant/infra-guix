#!/bin/sh

# Mount remote file systems over SSH
# This is a file system client based on the SSH File Transfer Protocol. 
# Since most SSH servers already support this protocol it is very easy to set up: 
# on the server side there's nothing to do; 
# on the client side mounting the file system is as easy as logging into the server with an SSH client.


echo "mounting sshfs"

sshfs florian@85.127.91.114:/nas /mnt/rock

