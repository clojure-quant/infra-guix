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
echo "os-install for $machine config-file: ./machine/$machine.scm" 


export GUILE_LOAD_PATH=./modules:$GUILE_LOAD_PATH

echo "building image for rock-pro"

# https://guix.gnu.org/en/blog/2017/porting-guixsd-to-armv7/
# https://framagit.org/tyreunom/guix-android
# https://gitlab.manjaro.org/manjaro-arm/packages/core/linux/-/blob/master/config
# https://guix.gnu.org/de/blog/2019/guix-on-an-arm-board/
# https://github.com/guix-mirror/guix/blob/master/gnu/system/images/rock64.scm
# build-rock (guix/system "image" "rock1")
# when this image is booted execute bash /etc/static/boostrap.sh
                    

# "--system=aarch64-linux"  ; via qemu (slow, but works)
# --target=aarch64-linux-gnu \ ; cross-compilation for TRIPLET
# --image-size=16G" ; use up most of the volume
guix system image \
  --substitute-urls="https://ci.guix.gnu.org https://bordeaux.guix.gnu.org https://substitutes.nonguix.org" \
  --image-type=rock64-raw \
  --target=aarch64-linux-gnu \
  --system=aarch64-linux \
  --image-size=16G \
  --cores=6 \
  --no-grafts \
  ./image/$machine.scm