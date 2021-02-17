#!/bin/bash

echo "guix: dev environment"
export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH

guix environment \
     --pure \
     --container \
     --preserve='^DISPLAY$' \
     --preserve='^TERM$' \
     --network \
     -m scm/manifests/dev.scm 
     

#         TERM \
#     --load-path=./scm  this is bad - crwates packages for all scm files
