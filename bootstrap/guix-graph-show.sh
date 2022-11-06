#!/bin/sh

export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH

# generate graph
# guix graph clojure | dot -Tpdf > dag.pdf
# guix graph clojure | xdot -

# guix graph --type=reverse-package python3 | xdot -

# guix graph --type=bag-emerged python3 | xdot -

guix system shepherd-graph ./machine/nuc.scm