#/bin/bash

# docker list-images

# echo "NODE_ENV: " ${NODE_ENV}


docker run \
       -p 7070:7070 \
       --net "host" \
       -e NODE_ENV=${NODE_ENV} \
       -t -i pinkgorilla:latest \
       /bin/bash