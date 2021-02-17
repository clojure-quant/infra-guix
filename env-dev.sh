#!/bin/bash

echo "guix: dev environment"
export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH

guix environment \
     --pure \
     --container \
     --preserve='^DISPLAY$' \
     --preserve='^TERM$' \
     --network \
     --share=$HOME/pinkgorilla \
     --share=$HOME/.m2 \
     -m scm/manifests/dev.scm 

# --expose is read-only
# --share is read/write     

# ~/pinkgorilla - git repos and build artefacts (node modules, shadowcljs)
# ~/.m2 - maven jars 


#    --share=$HOME/pinkgorilla:$HOME/pinkgorilla \
#     --load-path=./scm  this is bad - crwates packages for all scm files
