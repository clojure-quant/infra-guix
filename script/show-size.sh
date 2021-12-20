#!/bin/sh


export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH

echo "stats os.scm"
guix size $(guix system build os.scm)
#/bin/bash


echo "stats os.scm"
guix size $(guix system build os.scm)


# show giux package definition
# guix search icedtea
# guix show icedtea@3.7.0
# guix edit clojure

# generate graph
# guix graph clojure | dot -Tpdf > dag.pdf
# guix graph clojure | xdot -

guix graph --type=reverse-package python3 | xdot -

guix graph --type=bag-emerged python3 | xdot -