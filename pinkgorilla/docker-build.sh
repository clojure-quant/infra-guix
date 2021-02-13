
rm -R -f ./artefacts
mkdir ./artefacts

guix system \
     --root=./artefacts/docker-pinkgorilla.tar.gz \
     docker-image \
     ./os.scm

#     -m manifest.scm \

#          --root=./container \
#     --load-path=./scm  this is bad - crwates packages for all scm files

mkdir ./artefacts/docker-pinkgorilla
tar -xf ./artefacts/docker-pinkgorilla.tar.gz -C ./artefacts/docker-pinkgorilla
