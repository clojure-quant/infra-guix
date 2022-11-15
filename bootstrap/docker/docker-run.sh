#/bin/bash

image=$1:latest
echo "running bash in docker-image: $image "

# --user pink \
       
docker run \
    -d \
    -it $image \
    --network macvlan0

# "bridged"
#    /run/current-system/profile/bin/bash 
    #--login

echo "docker image $image started with id: $id"
