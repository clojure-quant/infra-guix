#/bin/bash

s=`cat artefacts/pinkgorilla-session`

echo "pinkgorilla docker session: " $s


docker exec \
    -it $s \
    --user pink \
     /run/current-system/profile/bin/bash #\
    #--login

#     /run/current-system/profile/bin/bash \