#!/bin/sh

# echo "guix: dev environment"
export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH

# remove packages older than 2 months, keep at least 200G free
echo "GUIX GC"
guix gc --optimize -d 2m 
guix gc -F 200G 

echo "GUIX PULL"
guix pull 
# guix system reconfigure -k /etc/config.scm

