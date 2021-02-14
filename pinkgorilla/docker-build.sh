
# guix
# https://github.com/pjotrp/guix-notes/blob/master/CONTAINERS.org#docker

# docker
# docker daemon has to be running
# for problems with docjer socket see:
# https://developer.fedoraproject.org/tools/docker/docker-installation.html

echo "cleaning up artefacts directory"
rm -R -f ./artefacts
mkdir ./artefacts

echo "saving build time.."
echo `date` >> ./artefacts/build-date

echo "getting manifest packages"
guix package --manifest=./manifest.scm

echo "saving channels.."
echo `guix describe` >> ./artefacts/channels


echo "removing old docker images"
docker rmi -f guix:latest
docker rmi -f pinkgorilla:latest

echo "guix is creating docker tar.gz file"
guix system \
     --cores=4 \
     --root=./artefacts/docker-pinkgorilla.tar.gz \
     docker-image \
     ./os.scm


#       --debug=2 \    
# debug 0-5 (5=highest)

# --verbosity=2 \
# -v, --verbosity=LEVEL  use the given verbosity LEVEL
# 0=none  1=short 2=all

# manifest does not work
# --manifest=manifest.scm \

# --root=file
# -r file
# Make file a symlink to the result, and register it as a garbage collector root.

# expose = read only
# -expose=$HOME 

# share = read/write
# --share=$HOME/tmp=/exchange
# -S /usr/bin=/bin 
# -S /etc/profile=/etc/profile \
# -S /book-evolutionary-genomics=/share/book-evolutionary-genomics \

# -p ~/opt/book-evolutionary-genomics \

# --no-grafts 

# -i book-evolutionary-genomics \

# --system=system
# -s system
# Attempt to build for system instead of the host system type. 
# This works as per guix build (see Invoking guix build).
# x86_64-linux

# --expression=expr
# -e expr
# Consider the operating-system expr evaluates to. 
# This is an alternative to specifying a file which evaluates to an operating system. 
# This is used to generate 
# the Guix system installer see Building the Installation Image).

# --entry-point=PROGRAM

# echo "uncompressing docker tar"
# mkdir ./artefacts/docker-pinkgorilla
# tar -xf ./artefacts/docker-pinkgorilla.tar.gz -C ./artefacts/docker-pinkgorilla

echo "docker is loading docker image from tar.gz .."
docker load --input ./artefacts/docker-pinkgorilla.tar.gz
# image will have tag guix:latest

echo "tagging image: pinkgorilla:latest"
docker tag guix:latest pinkgorilla:latest
