#!/bin/sh

# echo "guix: dev environment"
export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH

guix pull --channels=./channels.scm \
          --verbosity=3


