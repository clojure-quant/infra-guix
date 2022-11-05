#!/bin/bash

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

# sudo tailscale up

# tailscale ip -4

# https://tailscale.com/download/linux/static