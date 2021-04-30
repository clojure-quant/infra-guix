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
     --share=env/fish_prompt.fish=$HOME/.config/fish/functions/fish_prompt.fish \
     --share=env/config.fish=$HOME/.config/fish/config.fish \
     --share=env/fish_variables=$HOME/.config/fish/fish_variables \
     --share=$HOME/.m2 \
     --share=$HOME/.local/share/fish/fish_history \
     --share="$HOME/.emacs.d" \
     --expose=$HOME/.ssh \
     --expose=$HOME/.keystore \
     --expose=$HOME/Documents/myLinux \
     --share=$HOME/pinkgorilla \
     -m scm/manifests/dev.scm \
     -- fish



## LOCPATH is important for tmux

#      --pure \

# --expose is read-only
# --share is read/write     

# ~/pinkgorilla - git repos and build artefacts (node modules, shadowcljs)
# ~/.m2 - maven jars 


#    --share=$HOME/pinkgorilla:$HOME/pinkgorilla \
#     --load-path=./scm  this is bad - crw-eates packages for all scm files
