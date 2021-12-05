#!/bin/bash

echo "guix: dev environment"
export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH

guix package \
     -m scm/manifests/dev.scm 
     
#  install \        
#     --load-path=./scm  this is bad - crwates packages for all scm files
