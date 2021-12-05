#!/bin/sh

# It is highly recommended to run guix pull once before you run 
# guix system reconfigure for the first time  Failing to do that 
# you would see an older version of Guix once reconfigure has completed. 
echo "GUIX PULL (before updating config)"
guix pull

echo "GUIX upgrade packages to their latest version"
guix upgrade      

