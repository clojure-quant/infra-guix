#!/bin/sh
# sh and not bash, as on new guix only sh is known.

source ./bootstrap/guile-cache-clear.sh

# check that MYVAULT environment variable is set.
if [ -z $MYVAULT ] ; then
  echo "MYVAULT environment variable not set. exiting" 
  exit -4
fi
echo "VAULT LOCATION: $MYVAULT"


# read profile from first cli parameter
# profile="desktop"
machine=$1
# check that we got machine parameter
if [ -z $machine ] ; then
  echo "first cli parameter needs to be machine-name. exiting" 
  exit -4
fi
echo "docker image for $machine config-file: ./os/$machine.scm" 

export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH


# guix
# https://github.com/pjotrp/guix-notes/blob/master/CONTAINERS.org#docker

# docker
# docker daemon has to be running




# --root=file  or  -r file
# Make file a symlink to the result, and register it as a garbage collector root.
#  --root=./docker-image/docker-pinkgorilla.tar.gz \

#       --debug=2 \    
# debug 0-5 (5=highest)

# --verbosity=2 \
# -v, --verbosity=LEVEL  use the given verbosity LEVEL
# 0=none  1=short 2=all
# --entry-point=PROGRAM
# --entry-point=bin/guile
#   --no-grafts \
#  --save-provenance \

echo "guix is creating docker tar.gz file"
image=$(guix system image --image-type=docker \
        --cores=4 \
       ./os/$machine.scm)

# example what gets built:
# /gnu/store/g3zsngpk9h64y2jnrknhrxgwkmar563b-docker-image.tar.gz
echo "docker image was built: $image"

#echo "cleaning up artefacts directory"
#rm -R -f ./docker-image
#mkdir ./docker-image

# echo "uncompressing docker tar"
# mkdir ./artefacts/docker-pinkgorilla
# tar -xf ./artefacts/docker-pinkgorilla.tar.gz -C ./artefacts/docker-pinkgorilla

echo "docker is loading docker image: $image"
docker rmi -f guix:latest
docker load --input $image
# image will have tag guix:latest

echo "tagging image: $machine"
docker rmi -f $machine:latest
docker tag guix:latest $machine:latest

echo "docker images available: "
docker images
