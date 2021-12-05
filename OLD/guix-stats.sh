#/bin/bash

echo "stats core utils"
guix size coreutils

echo "stats clojure"
guix size clojure

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