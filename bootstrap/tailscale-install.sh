#!/bin/bash

# OUTDATED
# we have a custom package tailscale now
# use this file in case our custom package needs to be changed.

# https://tailscale.com/download/linux/static

dir="$HOME/bin"

mkdir -p $dir

cd $dir

export V="1.32.2"
export ARCH=amd64

echo "tailscale ${V} $ARCH"

wget "https://pkgs.tailscale.com/stable/tailscale_${V}_${ARCH}.tgz"

tar xvf "tailscale_${V}_${ARCH}.tgz"

# start the daemon:
# sudo $HOME/bin/tailscale/tailscaled 

# sudo tailscaled --state=tailscaled.state



# 

