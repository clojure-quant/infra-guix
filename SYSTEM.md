# system

A system is an operating system config with services.

## info
´´´
guix system 
   search           search for existing service types
 --list-image-types list available image types
´´´


## system profile admin

´´´
guix system 
   describe         reproduce system data

   extension-graph  emit the service extension graph in Dot format
   shepherd-graph   emit the graph of shepherd services in Dot format

   init             initialize a root file system to run GNU
   reconfigure      switch to a new operating system configuration
   roll-back        switch to the previous operating system configuration
   list-generations list the system generations
   switch-generation switch to an existing operating system configuration
   delete-generations delete old system generations
´´´


# export 
´´´
guix system 
 build            build the operating system without installing anything
   container        build a container that shares the host's store
   vm               build a virtual machine image that shares the host's store
   vm-image         build a freestanding virtual machine image
   image            build a Guix System image
   docker-image     build a Docker image

    --share=SPEC       for 'vm' and 'container', share host file system with
                         read/write access according to SPEC
      --expose=SPEC      for 'vm' and 'container', expose host file system
                         directory as read-only according to SPEC
  -N, --network          for 'container', allow containers to access the network
  -r, --root=FILE        for 'vm', 'vm-image', 'image', 'container',
                         and 'build', make FILE a symlink to the result, and
                         register it as a garbage collector root
  -v, --verbosity=LEVEL  use the given verbosity LEVEL


´´´

Export systems

guix system vm config.scm
guix system docker-image config.scm
guix system container config.scm


guix copy --from=remote-host    one off copy
guix pack -f docker dovecot       Exporting for Use Outside of Guix
                                                   pack pass software to non Guix users.
       guix pack --format=docker python python-numpy
guix publish                                Serve Packages


# Sample configurations
Several configs     https://github.com/Millak/guix-config/blob/master/vm_config.scm
Big setup:             https://github.com/alezost/guix-config
Services               https://lists.gnu.org/archive/html/help-guix/2019-05/msg00262.html



# My tools

Clojure
clojure-build-system
This variable is exported by (guix build-system clojure). It implements a simple build procedure for Clojure packages using plain old compile in Clojure. Cross-compilation is not supported yet.

Webbrowser Like emacs
https://nyxt.atlas.engineer/faq

In guix tarball.
10:40 PM <iyzsong> awb99: you can try 'gnu/system/examples/docker-image.tmpl', maybe then add a 'nginx-service-type' to its services field.
.
Auf einer Fremddistribution können Sie den Erstellungsdaemon aktualisieren, indem Sie diesen Befehl:

sudo -i guix pull
systemctl restart guix-daemon.service



guix size coreutils

guix graph coreutils | dot -Tpdf > dag.pdf
guix copy --to=Benutzer@Rechner \
          coreutils `readlink -f ~/.guix-profile`

guix copy --to=Benutzer@Rechner \
          coreutils `readlink -f ~/.guix-profile`

docker exec -ti $container_id /run/current-system/profile/bin/bash --login

guix system container my-config.scm \
   --expose=$HOME --share=$HOME/tmp=/exchange


. Being unable to read NVME drives (which have been around since 2011) is no longer acceptable for an OS in 2020.

