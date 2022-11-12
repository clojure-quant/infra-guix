#!/bin/sh

# brings up error messages but it still works
# https://github.com/VSCodium/vscodium/issues/849
codium \
  --enable-features=UseOzonePlatform \
  --ozone-platform=wayland \
  --verbose \
  --log=debug \
  --disable-extensions \
  --disable-gpu
