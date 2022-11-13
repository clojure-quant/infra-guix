#/bin/bash

machine=$1
echo "zsh on docker session: " $machine

docker exec \
    -it $machine \
     /run/current-system/profile/bin/zsh \
    --login
