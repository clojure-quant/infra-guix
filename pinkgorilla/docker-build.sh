
# see:
# https://github.com/pjotrp/guix-notes/blob/master/CONTAINERS.org#docker

# docker daemon has to be running
# for problems with docjer socket see:
# https://developer.fedoraproject.org/tools/docker/docker-installation.html

echo "cleaning up artefacts directory"
rm -R -f ./artefacts
mkdir ./artefacts

echo "guix is creating docker tar.gz file"
guix system \
     --root=./artefacts/docker-pinkgorilla.tar.gz \
     docker-image \
     ./os.scm
#     --manifest=manifest.scm \
#          --root=./container \
#  -S /usr/bin=/bin 
#  -S /etc/profile=/etc/profile \
#  -S /book-evolutionary-genomics=/share/book-evolutionary-genomics \
# -p ~/opt/book-evolutionary-genomics \
#  --no-grafts 
#  -i book-evolutionary-genomics \
# --entry-point=PROGRAM


# echo "uncompressing docker tar"
# mkdir ./artefacts/docker-pinkgorilla
# tar -xf ./artefacts/docker-pinkgorilla.tar.gz -C ./artefacts/docker-pinkgorilla

echo "docker is loading docker image from tar.gz .."
docker load --input ./artefacts/docker-pinkgorilla.tar.gz
# image will have tag guix:latest

echo "tagging image: pinkgorilla:latest"
docker tag guix:latest pinkgorilla:latest
