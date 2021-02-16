#!/bin/bash

# Declare an array of string with type
declare -a RepoNameArray=( \
"pinkie" "gorilla-ui" \
"webly" "goldly" "goldly-demo" "goldly-example-golf" "goldly-example-datascience" \
"picasso"  "gorilla-explore" "notebook-ui" "notebook-encoding" "nrepl-middleware" "notebook-clj" \
"gorilla-plot" "python-gorilla"  "clojisr-gorilla" \
"pink-gorilla.github.io" "lein-pinkgorilla" )

# "../quant/trateg" "../../gorilla" ../quant/trateg
# "libpython-clj-examples"
# deas/pink-gorilla-infra
# kernel-cljs-shadow                  
# kernel-cljs-shadowdeps
# gorilla-notebook
# docker
# tech.viz tradingview clojupyter gorilla-depreciated klangmeister 
# ui-geschichte clojurewb ui-graph ui-shapes fortune nextjournal 
# punk2 unnecessarily-3d-clock gg4clj                                                   
# haunting-refrain-posh quil-examples
# integrator notebook-junk sente "sample-notebooks"

main="$HOME/pinkgorilla"

info() {
  reponame="$1"
  repodir="$main/$1"
  if [ -d $repodir ]; then
    echo "$reponame: $repodir does exist."
  else 
    echo "$reponame: $repodir does not exist."
  fi
}

gitclone() {
  reponame="$1"
  repodir="$main/$1"
  repossh="git@github.com:pink-gorilla/$reponame.git"
  if [ -d $repodir ]; then
    echo "$reponame: $repodir does exist. not cloning."
  else 
    echo "$reponame: $repodir does not exist. cloning!"
    cd $main
    git clone $repossh
  fi
}

gitstatus () {
  reponame="$1"
  repodir="$main/$1"
  if [ -d $repodir ]; then
     cd $repodir
     git status --short
  else 
      echo "$reponame: $repodir does not exist."
  fi
}

clean () {
  # rm .settings -r
  rm -rf node_modules target out .shadow-cljs
}

# Iterate the string array using for loop
for val in ${RepoNameArray[@]}; do
   gitclone $val
   # info $val
done

