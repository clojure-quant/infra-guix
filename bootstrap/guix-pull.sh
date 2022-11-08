#!/bin/sh

echo "guix pull (update git repos) ..."

guix pull \
  --channels=./channels.scm \
  --verbosity=3 \
  --max-silent-time=10000 \
  --timeout=10000 \
  --substitute-urls="https://ci.guix.gnu.org https://bordeaux.guix.gnu.org https://substitutes.nonguix.org"