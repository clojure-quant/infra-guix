#!/bin/sh

# CLONE GIT REPO

# guix package -i nss-certs
#export SSL_CERT_DIR="$HOME/.guix-profile/etc/ssl/certs"
#export SSL_CERT_FILE="$HOME/.guix-profile/etc/ssl/certs/ca-certificates.crt"
#export GIT_SSL_CAINFO="$SSL_CERT_FILE"
# date -d "2021-12-07 22:10:15"  
# this is needed because on clone time the date is off
export GIT_SSL_NO_VERIFY=true

cd /home
sudo mkdir shared
sudo chown florian shared
sudo chgrp users shared

cd /home/shared
mkdir repo
cd repo
mkdir clojure-quant
cd clojure-quant
git clone https://github.com/clojure-quant/trateg.git

cd trateg
mkdir target
mkdir target/db
mkdir target/db/crypto
mkdir target/db/stocks
mkdir target/db/random
mkdir target/db/shuffled

mkdir app/resources/tradingview-charts