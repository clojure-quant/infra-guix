#!/bin/sh

export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH

guix pull --channels=./channels.scm \
          --verbosity=3


