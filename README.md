# pinkgorilla infra-guix

GNU GUIX is a package manager and/or an operating system.
Configuration is done in Guile (Scheme) scripts.
For GUIX installation see DOCS/GUIX-INSTALL.

## GUIX App bundle

We created a configuration to install all tools needed to 
run pinkgorilla notebook and to develop it.

Tools include:
- Clojure / Java / Leiningen 
- Node / Npm (for shadowcljs clojurescript builds)
- Python / R (for datascience)

Develop Pinkgorilla by using GUIX.

## Development

´´´
./dev-env.sh   Creates a virtual environment (can be exited with CTRL+D)
that only exports the apps/environment variables of the GUIX app bundle.
Therefor builds are guaranteed to be deterministic.
´´´

## Docker 

GUIX can create Docker Images that could be run in a KVM cluster.

´´´
./docker-build.sh
./docker-start.sh
./docker-exec.sh
./docker-stop.sh
´´´

