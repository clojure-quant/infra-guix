#!/bin/sh

echo "bootstrapping arm image"

#guix install util-linux
#echo "cfdisk, select the /dev/vda2 root partition, select Resize, Write and type yes. "
#cfdisk

# sudo bash /etc/static/resize-disk.sh sd

guix package --manifest=/etc/static/manifest-bootstrap.scm


date -d "2021-12-07 22:10:15"


# guix package -i nss-certs
export SSL_CERT_DIR="$HOME/.guix-profile/etc/ssl/certs"
export SSL_CERT_FILE="$HOME/.guix-profile/etc/ssl/certs/ca-certificates.crt"
export GIT_SSL_CAINFO="$SSL_CERT_FILE"



cd /home/florian
mkdir repo
cd repo
mkdir clojure-quant
cd clojure-quant
git clone https://github.com/clojure-quant/infra-guix.git
cd infra-guix


guix system reconfigure ./machine/rock-ssh.scm

# install channels
export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH
sudo guix pull --channels=/home/florian/repo/clojure-quant/infra-guix/channels.scm \
          --verbosity=3



# guix install babashka
# sudo guix install babashka