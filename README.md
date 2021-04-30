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

## Run Pinkgorilla Demos

Initial Install
```
mkdir /home/pinkgorilla
./admin.sh gitclone pinkie
```

To create the virtual environment
```
./dev-env.sh 

```

Inside the virtual environment:
```

# Enduser Apps and Examples
./admin.sh demo notebook-clj  
./admin.sh demo goldly-example-datascience 

# Developer Libraries
./admin.sh demo pinkie
./admin.sh demo webly
./admin.sh demo goldly
./admin.sh demo gorilla-ui
./admin.sh demo nrepl-middleware
          
          
```


## Docker 

GUIX can create Docker Images that could be run in a KVM cluster.

```
 ./docker-build.sh
 ./docker-start.sh
 ./docker-exec.sh
 ./docker-stop.sh
```

http://guix.gnu.org/en/packages/r-rserve-1.8-6/



## guix bugs

/usr/bin/env
karma test runner needs it. Create a symlink automatically
fix: run ./env.sh after guix env is created.

# python

PYTHON env variable: if python3 is installed in host, this variable
fucks up local apps that use python. I only install python in dev 
profile. so should not be an issue. solution: unset python in bashrc
or wait for update (which comes soon)

it will complain with “Permission denied” because it is trying to install in the (immutable) Guix store. Override with

pip3 install --user package-name


GIT SSL: if guest os has ssl issue with git:
git config --global http.sslverify false


tmux:
tmux: need UTF-8 locale (LC_CTYPE) but have ANSI_X3.4-1968
guix environment --container --ad-hoc glibc-utf8-locales tmux …
export GUIX_LOCPATH=$GUIX_ENVIRONMENT/lib/locale
or use the option --preserve.