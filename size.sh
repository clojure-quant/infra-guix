#/bin/bash

export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH


echo "stats os.scm"
guix size $(guix system build os.scm)
