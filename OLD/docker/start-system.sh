guix system \
     -m manifest.scm \
     --root=./docker-image \
     container \
     os.scm
#          --root=./container \
#     --load-path=./scm  this is bad - crwates packages for all scm files
