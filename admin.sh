#!/bin/sh

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
  reponame="$1"
  repodir="$main/$1"
  echo "cleaning $reponame"
  # rm .settings -r
  #rm -rf node_modules target out .shadow-cljs
  # rm target/ -r
  # rm .shadow-cljs/ -r
}

demo () {
  reponame="$1"
  repodir="$main/$1"
  app="$2"
  if [ -d $repodir ]; then
     cd $repodir
     echo "running demo for $reponame in path: $repodir"
     if [[ -n $GUIX_ENVIRONMENT ]]; then
         case $reponame in
            'pinkie')
                   echo "running pinkie demo" ;;
            'webly')
                   echo "running webly demo" 
                   npm install & lein demo ;;
            'gorilla-ui')
                   echo "running gorilla-ui demo" 
                   npm install && lein demo ;;
            'goldly')
                   echo "running goldly demo" 
                   npm install && lein shadow-compile && lein goldly ;;
            'goldly-example-datascience')
                   echo "running goldly-example-datascience demo" 
                   #npm install && lein shadow-compile && 
                   lein goldly ;;
            'notebook-clj')
                   echo "running notebook-clj demo" 
                   #npm install && lein shadow-compile && 
                   npm install
                   lein build-prod
                   lein notebook ;; 
            *)
                   echo "no demo command defined for repo: $reponame"
                   exit 0 ;;
         esac
      else
          echo "not running in a guix environment. exiting."
          exit 0
      fi   
  else 
      echo "$reponame: $repodir does not exist. cannot run demo"
  fi
}

help () {
  echo "admin"
  echo "admin info         shows missing repos"
  echo "admin gitclone     clones non existing gorilla git repos"
  echo "admin gitstatus    git status all git repos"
  echo "admin clean        cleans temp build paths in git repos"
  echo "admin demo webly   runs webly demo (change webly for any other name"
  echo ""
  echo "useful guix commands:"
  echo "guix package --list-installed"
  echo "guix package --list-profiles"
  echo "guix package --delete-generations"
  echo ""
  echo "available packages:"
  echo $RepoNameArray
}

op=$1
case $op in

'info')
prog="info" ;;

'gitclone')
prog="gitclone" ;;

'gitstatus')
prog="gitstatus" ;;

'clean')
prog="clean" ;;

'demo')
prog="demo" ;;

*)
help
exit 0 ;;

esac

APP="$2"
echo "app: $APP"
if [[ -n $APP ]]; then
  echo "running $prog for app $APP "
  $prog $APP
else
  echo "running $prog for all repos"
  # Iterate the string array using for loop
  for reponame in ${RepoNameArray[@]}; do
     #gitclone $reponame
     # info $reponame
     $prog $reponame %2
  done
fi


  



