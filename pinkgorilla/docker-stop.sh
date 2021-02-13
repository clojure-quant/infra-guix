#/bin/bash

s=`cat artefacts/pinkgorilla-session`

echo "pinkgorilladocker session: " $s


docker stop $s
