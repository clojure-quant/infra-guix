#!/bin/bash

echo "guix: dev environment"
export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH

guix environment \
     --pure \
     --preserve='^DISPLAY$' \
     --preserve='^TERM$' \
     --container \
     -m scm/manifests/dev.scm 
     

#         TERM \
#     --load-path=./scm  this is bad - crwates packages for all scm files
