
## info
´´´
guix system 
   search           search for existing service types
 --list-image-types list available image types
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





# Containers
Guix can also generate docker images

https://github.com/pjotrp/guix-notes/blob/master/CONTAINERS.org
Orchestration: 
https://gitlab.com/pjotrp/guix-notes/-/blob/master/DEPLOY.org


guix copy --to=Benutzer@Rechner \
          coreutils `readlink -f ~/.guix-profile`

guix system container my-config.scm \
   --expose=$HOME --share=$HOME/tmp=/exchange




´´´# environments
When running guix environment SOME-PACKAGES, Guix sets up a temporary environment where all the requirements for SOME-PACKAGES are exposed the environment manifest is just a Scheme code file that evaluates to a list of packages to include inside the environment. An environment is an ephemeral thing (just a process tree/container/whatever).  It spawns a subshell, exit with CTRL-D.

You can basically define a manifest and invoke it with 
guix environment --pure                         one of pure or container or nothing
                            --container
                            --share=$HOME=$HOME
                            -N                                            for containers that need network access
with --pure, you might need to preserve some env vars with -E (e.g. $DISPLAY)

Example manifest https://git.elephly.net/gitweb.cgi?p=software/mumi.git;a=blob;f=guix.scm;h=cbc5e6671efa30ebfd776f5fca1ee1e37cef779b;hb=HEAD

directly spawn the program you like with: 
guix environment -m manifest.scm
guix environment --pure        --ad-hoc jq -- jq --help
guix environment --container --ad-hoc gcc-toolchain
The option --container ensures the best possible isolation from the standard environment that your system installation and user account provide for day-to-day work. This environment contains nothing but a C compiler and a shell (which you need to type in commands), and has access to no other files than those in the current directory.

If the term "container" makes you think of Docker, note that this is something different. Note also that the option --container requires support from the Linux kernel, which may not be present on your system, or may be disabled by default. Finally, note that by default, a containerized environment has no network access, which may be a problem. If for whatever reason you cannot use --container, use --pure instead


1:17 AM <terpri> (info "(guix) Invoking guix environment") shows how to change the prompt on foreign distros (it's just based on $GUIX_ENVIRONMENT existing)



# Export ISO image

guix system disk-image -t iso9660 /home/andreas/Documents/myguix/c2.scm
/gnu/store/6phpslb8z6zz6npii8qcnsrcvmwqz982-image.iso

sudo dd if=/gnu/store/6phpslb8z6zz6npii8qcnsrcvmwqz982-image.iso of=/dev/sdb status=progress
sync