#!/bin/sh

echo "bootstrapping arm image"

#guix install util-linux
#echo "cfdisk, select the /dev/vda2 root partition, select Resize, Write and type yes. "
#cfdisk

guix package --manifest=/etc/static/manifest-bootstrap.scm

cd /home/florian
mkdir repo
cd repo
mkdir clojure-quant
cd clojure-quant
git clone https://github.com/clojure-quant/infra-guix.git
cd infra-guix


export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH

sudo guix pull --channels=./channels.scm \
          --verbosity=3


sudo guix install babashka