#!/bin/sh


export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH

guix weather --manifest=./manifest/nuc.scm
