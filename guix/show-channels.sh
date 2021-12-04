#!/bin/sh

# echo "guix: dev environment"
export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH

guix package --export-channels 