#/bin/bash

# https://docs.docker.com/engine/reference/commandline/system_prune/

# docker will accumulate a lot of disk space over time,
# especially when images are built often.
# this command will free 10s of gigabytes

docker system prune