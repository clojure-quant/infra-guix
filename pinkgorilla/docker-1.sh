#/bin/bash

# https://linuxnatives.net/2019/align-user-ids-inside-and-outside-docker-with-subuser-mapping

docker run \
       --privileged \
       -p 7070:7070 \
       --net "host" \
       -t -i pinkgorilla:latest \
       /run/current-system/profile/bin/bash \
       --login \

#       --user pink \
#              -e NODE_ENV=${NODE_ENV} \
#       -v $HOME/pinkgorilla:/pinkgorilla \