#!/bin/sh

# The least risky method I know of, is to pull guix into a _separate_
# profile , and use that guix to build the installation image:

guix pull --profile=./artefact/guix-cuf --branch=core-updates-frozen


./artefact/guix-cuf/bin/guix system disk-image --target=aarch64-linux-gnu -e '(@ (gnu system install) rock64-installation-os)'

# That way, the core-updates-frozen guix will only be used for building
# the installation image, and nothing else.


# Seit kurzem geht es so, wie in gnu/packages/webkit.scm mit
# ,@(if (target-x86-64?) `(…) `(…))
# aber das ist Guix-spezifisch und nicht dokumentiert, d.h. es kann sich
# theoretisch jederzeit ändern.
