#!/bin/bash

echo "guix: dev environment"
export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH

# R_HOME must be set so Rserve is found.
# export R_HOME=$HOME/.guix-profile/lib/R
export R_HOME=$(guix build r-minimal)/lib/R 

guix environment \
     --container \
     --preserve='^DISPLAY$' \
     --preserve='^TERM$' \
     --preserve='^R_HOME$' \
     --preserve='^GUIX_LOCPATH$' \
     --network \
     --share=$HOME/pinkgorilla \
     --share=$HOME/.m2 \
     -m scm/manifests/dev.scm 

## LOCPATH is important for tmux

#      --pure \

# --expose is read-only
# --share is read/write     

# ~/pinkgorilla - git repos and build artefacts (node modules, shadowcljs)
# ~/.m2 - maven jars 


#    --share=$HOME/pinkgorilla:$HOME/pinkgorilla \
#     --load-path=./scm  this is bad - crwates packages for all scm files
