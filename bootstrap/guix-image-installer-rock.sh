#!/bin/sh
# sh and not bash, as on new guix only sh is known.

source ./bootstrap/guile-cache-clear.sh

echo "building rock-pro installer"

# guix system image -t rock64-raw --system=aarch64-linux -e "(@ (gnu system install) rockpro64-installation-os)"
# https://github.com/SystemCrafters/guix-installer
# https://github.com/ofosos/guix-packer
                    

# "--system=aarch64-linux"  ; via qemu (slow, but works)
# --target=aarch64-linux-gnu \ ; cross-compilation for TRIPLET

# --image-size=16G \
# ""

guix system image \
  --substitute-urls="https://ci.guix.gnu.org https://bordeaux.guix.gnu.org https://substitutes.nonguix.org" \
  --image-type=rock64-raw \
  --system=aarch64-linux \
  --target=aarch64-linux-gnu \
  --cores=6 \
  --no-grafts \
  -e "(@ (gnu system install) rockpro64-installation-os)"
                                             