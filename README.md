# pinkgorilla infra-guix

Guix Config for clojure datascience work.

GNU GUIX is a package manager and/or an operating system that is configured via Guile (Scheme).

## requirements

- guix installed (package manager (guix foreign) or guix operating system)
  For GUIX installation see DOCS/foreign.md
- babashka

# Understanding the Content of this Repository

Although the repo might be used for inspiration, it's not meant to be
generic in any way: it's only my configuration.

The modules directory contains guile modules that are used by multiple
systems. They are loaded in the guile PATH along with guix modules during
the call to the guix system command that generates the system.

The motd and keys directories contain data files that are meant to be
copied directly to the store, thanks to local-file.

The systems directory contain the actual configurations, one file per
system, named after the host-name of the system.


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


# Docker 

GUIX can create Docker Images that could be run in a KVM cluster.

```
 ./docker-build.sh
 ./docker-start.sh
 ./docker-exec.sh
 ./docker-stop.sh
```


https://github.com/wting/autojump
Guix  autojump or fasd

https://github.com/clvv/fasd

