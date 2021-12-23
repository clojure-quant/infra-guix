#!/bin/sh

# this is not needed for production, as trateg-goldly runs via herd.
# but it might be useful for debugging.

cd /home/shared/repo/clojure-quant/trateg/app/demo

clj -X:goldly-docs
