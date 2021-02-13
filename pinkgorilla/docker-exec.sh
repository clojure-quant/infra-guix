#/bin/bash

s=`cat artefacts/pinkgorilla-session`

echo "pinkgorilladocker session: " $s


docker exec -it $s /run/current-system/profile/bin/bash --login