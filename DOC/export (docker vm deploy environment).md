# guix export 

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

# environments
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


# Containers
Guix can also generate docker images

https://github.com/pjotrp/guix-notes/blob/master/CONTAINERS.org
Orchestration: 
https://gitlab.com/pjotrp/guix-notes/-/blob/master/DEPLOY.org


guix copy --to=Benutzer@Rechner \
          coreutils `readlink -f ~/.guix-profile`

guix system container my-config.scm \
   --expose=$HOME --share=$HOME/tmp=/exchange



# Export ISO image

guix system disk-image -t iso9660 /home/andreas/Documents/myguix/c2.scm
/gnu/store/6phpslb8z6zz6npii8qcnsrcvmwqz982-image.iso

sudo dd if=/gnu/store/6phpslb8z6zz6npii8qcnsrcvmwqz982-image.iso of=/dev/sdb status=progress
sync

# guix deploy

## hostile takeover approach
; https://git.pixie.town/pinoaffe/config/src/branch/master/hostile_takeover.sh

https://stumbles.id.au/getting-started-with-guix-deploy.html
https://guix.gnu.org/blog/2019/managing-servers-with-gnu-guix-a-tutorial/
https://wiki.pantherx.org/Installation-digital-ocean/
https://git.savannah.gnu.org/cgit/guix/maintenance.git/tree/hydra/berlin.scm
https://guix.gnu.org/cookbook/en/guix-cookbook.html#Running-Guix-on-a-Linode-Server
https://othacehe.org/hosting-a-blog-using-only-scheme.html

       ; AWS
        ; https://cloudinit.readthedocs.io/en/stable/
        ; # guix package: cloud-utils    has cloud-init
        ; Guile AWS for AWS backend.
