#/bin/bash

# echo "NODE_ENV: " ${NODE_ENV}

#sudo 
docker run \
       -p 7070:7070 \
       --net "host" \
       -e NODE_ENV=${NODE_ENV} \
       -t -i ./artefacts/docker-pinkgorilla \
       /bin/bash