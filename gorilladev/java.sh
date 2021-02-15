#!/bin/bash


function check {
  echo "checking: " $1
  cd $1
  rm .settings -r
  #git status --short
  cd ..
}

check "notebook-encoding"
check "gorilla-explore"
check "gorilla-middleware"
check "gorilla-notebook"
check "sample-notebooks"
check "gorilla-plot"
check "gorilla-renderable"
check "gorilla-renderable-ui"
check "gorilla-ui"
check "../quant/trateg" "../../gorilla"

