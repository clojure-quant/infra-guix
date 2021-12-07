#!/bin/sh

# echo "guix: dev environment"
export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH

sudo guix pull --channels=/home/florian/repo/clojure-quant/infra-guix/channels.scm \
          --verbosity=3


