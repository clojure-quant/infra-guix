#!/bin/sh

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
git clone https://github.com/clojure-quant/trateg.git
cd trateg