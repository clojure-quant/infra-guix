#!/bin/bash

# https://linuxnatives.net/2019/align-user-ids-inside-and-outside-docker-with-subuser-mapping

#sudo docker run \
#       --privileged \
#       -p 7070:7070 \
#       --net "host" \
#       -t -i nss-certs-openssh-sans-x-mc-openjdk:latest \
#       /run/current-system/profile/bin/bash \
#       --login 

#       --user pink \
#              -e NODE_ENV=${NODE_ENV} \
#       -v $HOME/pinkgorilla:/pinkgorilla \


# this works, but it is dependent on the image id
# sudo docker run -t -i 4db8f66647c3 bash

# sudo docker run -t -i nss-certs-openssh-sans-x-mc-openjdk:latest bash

sudo docker run -t -i \
   --net "host" \
   nss-certs-openssh-sans-x-mc-openjdk:latest bash

