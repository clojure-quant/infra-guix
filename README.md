# pinkgorilla infra-guix

GNU GUIX is a package manager and/or an operating system.
Configuration is done in Guile (Scheme) scripts.
For GUIX installation see DOCS/GUIX-INSTALL.

For a reproduceable build two things are needed:
- channel config: the repository setup. We use nonfree which is
not included in standard gux. For each channel the git commit 
defines the version of the packages that are used.
- package config: This is done in scm/gorilla/packages.scm
  
Todo: make channel import script thatworks.

## GUIX App bundle

We created a configuration to install all tools needed to 
run pinkgorilla notebook and to develop it.

Tools include:
- Clojure / Java / Leiningen 
- Node / Npm (for shadowcljs clojurescript builds)
- Python / R (for datascience)

Develop Pinkgorilla by using GUIX.

## Development

Admin Tool: To clone all pinkgorilla git repos to /home/pinkgorilla execute

```
./admin.sh gitclone            runs git clone on all repos that do not exist on disk

./admin.sh info 
./admin.sh info pinkie

./admin.sh gitstatus            git status for all reps
./admin.sh gitstatus pinkie     git status for pinkie repo

./admin.sh demo pinkie          run demo app git for pinkie repo
```

Create a virtual environment (can be exited with CTRL+D)
that only exports the apps/environment variables of the GUIX app bundle.
Therefore builds are guaranteed to be deterministic.


Say you want to test pinkie and you havent any repo:
```
mkdir /home/pinkgorilla
./admin.sh gitclone pinkie
./dev-env.sh 
./admin.sh demo pinkie          run demo app git for pinkie repo  
```

Example:
```
./dev-env.sh

```



## Docker 

GUIX can create Docker Images that could be run in a KVM cluster.

```
 ./docker-build.sh
 ./docker-start.sh
 ./docker-exec.sh
 ./docker-stop.sh
```

