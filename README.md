# pinkgorilla infra-guix

My Guix Config for clojure datascience work.

GNU GUIX is a package manager and/or an operating system that is configured via Guile (Scheme).

## requirements

- guix installed (package manager (guix foreign) or guix operating system)
  For GUIX installation see DOCS/guix-foreign.md
- babashka

## Understanding the Content of this Repository

Although the repo might be used for inspiration, it's not meant to be
generic in any way: it's only my configuration.

The modules directory contains guile modules that are used by multiple
systems. They are loaded in the guile PATH along with guix modules during
the call to the guix system command that generates the system.

The motd and keys directories contain data files that are meant to be
copied directly to the store, thanks to local-file.

The systems directory contain the actual configurations, one file per
system, named after the host-name of the system.




