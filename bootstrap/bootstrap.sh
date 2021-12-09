#!/bin/sh

echo "bootstrapping arm image"

#guix install util-linux
# sudo cfdisk /dev/mmcblk0
# cfdisk does not let me make the disk bigger
 
# sudo bash /etc/static/resize-disk.sh sd

guix package --manifest=/etc/static/manifest-bootstrap.scm


# CLONE GIT REPO

# guix package -i nss-certs
#export SSL_CERT_DIR="$HOME/.guix-profile/etc/ssl/certs"
#export SSL_CERT_FILE="$HOME/.guix-profile/etc/ssl/certs/ca-certificates.crt"
#export GIT_SSL_CAINFO="$SSL_CERT_FILE"
# date -d "2021-12-07 22:10:15"  
# this is needed because on clone time the date is off
export GIT_SSL_NO_VERIFY=true
cd /home/florian
mkdir repo
cd repo
mkdir clojure-quant
cd clojure-quant
git clone https://github.com/clojure-quant/infra-guix.git
cd infra-guix


# install channels
export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH
sudo guix pull --channels=/home/florian/repo/clojure-quant/infra-guix/channels.scm \
          --verbosity=3

# reconfigure to rock-ssh
# sudo guix system reconfigure ./machine/rock-ssh.scm

