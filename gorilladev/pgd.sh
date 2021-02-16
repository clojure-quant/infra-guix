#!/bin/bash

echo "image parameter: " $1
echo "command parameter: " $2


# Image Name that should be build (options: dev r)
name="" 
dir=""
case "$1" in
   "dev") name="pinkgorillawb/notebook-dev"
          dir="./notebook-dev"
   ;;
   "r") name="pinkgorillawb/notebook-r"
        dir="./notebook-r"
   ;;
esac
echo "docker image name: " $name



function build {
  docker build \
     $dir \
     -t \
     $name:latest
}

function rebuild {
  docker build \
     --no-cache \
     $dir \
     -t \
     $name
}

function interactive {
  docker run \
     -p 3449:3449 \
     --net "host" \
     -t -i $name \
     lein run -m clojure.main script/figwheel.clj
     #       /bin/bash
}

function start {
   docker run \
     -dit \
     --restart unless-stopped \
     -p 3449:3449 \
     --net "host" \
     $name
}

function shell {
   image=`docker ps -f ancestor="$name" -q`
   echo IMAGE is $image
   echo now bashing into the running image..
   docker exec -i -t $image /bin/bash
}

function push {
   docker push $name
}



case "$2" in
  build)
    build
    ;;
         
  rebuild)
    rebuild
    ;;
         
  interactive)
    interactive
    ;;
  
  start)
    start
    ;;

  shell)
    shell
    ;;

   push)
    push
    ;;
         
  *)
    echo $"Usage: $0 {dev|r|spark|prod} {build|rebuild|interactive|start|shell|push}"
    exit 1
esac


