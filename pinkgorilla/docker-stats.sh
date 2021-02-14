#/bin/bash

echo "stats core utils"
guix size coreutils

echo "stats clojure"
guix size clojure

echo "stats os.scm"
guix size $(guix system build os.scm)


# show giux package definition
# guix search icedtea
# guix edit clojure
# guix show icedtea@3.7.0


# generate graph
# guix graph clojure | dot -Tpdf > dag.pdf
# guix graph clojure | xdot -

