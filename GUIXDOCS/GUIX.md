# Docs
https://guix.gnu.org/manual/en/guix.html#The-Perfect-Setup
http://guix.gnu.org/cookbook/en/guix-cookbook.html
https://git.sr.ht/~lle-bout/awesome-guix#awesome-guix
https://github.com/pjotrp/guix-notes/blob/master/HACKING.org
https://framagit.org/tyreunom/guix-home-manager
https://ambrevar.xyz/guix-advance/

# Directories
ls /gnu/store
cat  ~/.config/guix/current/etc/profile       bash env variables
ls  ~/.guix-profile/bin                              installed binaries

~/.guix-profile                    the default user profile
~/.config/guix/current         profile, populated by guix pull
/var/guix/profiles/system

# profiles

Goal: create byte identical profiles over time that are not only shared between machines (important for deployment) but also between developers. Development, testing, staging, production - essentially these are all profiles!

guix package -i sambamba -p ~/opt/sambamba
Guix provides a profile file which contains the necessary shell settings into the environment
cat ~/opt/sambamba/etc/profile

# Channels (repositories)
A channel is a git repo that defines packages in scheme files that can be built.
https://gitlab.com/pjotrp/guix-notes/-/blob/master/CHANNELS.org

guix describe                shows installed repositories  
cat  ~/.config/guix/channels.scm             config file for custom channels
cat  ~/.config/guix/current/manifest         shows all channels

1:34 AM <dftxbs3e> Inferiors allow you to fetch channels, then you can use that inferior to lookup packages in channels from your manifest and return them

Important add-on channels:
Guix patches: more up to date packages https://git.guix-patches.cbaines.net/guix-patches/?h=base patches are added via https://issues.guix.gnu.org/
Nonfree: wifi driver, qemu, steem https://www.rohleder.de/gitweb/?p=guix.git;a=blob;f=mroh/guix/install.scm;hb=HEAD
Nonguix clojure steam broadcom installer nonfree https://gitlab.com/nonguix/nonguix
https://gitlab.com/nonguix/nonguix/-/tree/master/
Bio informatics https://github.com/pjotrp/guix-notes/blob/master/BIOINFORMATICS.org
Gaming https://gitlab.com/guix-gaming-channels
RStudio https://github.com/leibniz-psychology/guix-zpid
https://github.com/UMCUGenetics/guix-additions/tree/master/umcu/packages
https://gitlab.com/genenetwork/guix-bioinformatics r shiny cran java node shell python2 python3 machine learning tensor flow mysql numpy services: shiny
Guix past channel: old Python versions https://gitlab.inria.fr/guix-hpc/guix-past
https://gitlab.inria.fr/guix-hpc/guix-hpc-non-free cuda mkl 
https://gitlab.inria.fr/guix-hpc/guix-hpc
https://gitlab.com/mbakke/guix-chromium


By default guix pull
reads ~/.config/guix/channels.scm; with -C it can take channel specifications from a user-supplied file 

# Packages
https://guix.gnu.org/de/packages
The exact installed version depends on the version-hash of the channel.
A manifest is a scm file that can be installed with one click. From a profile the manifest can be extracted.

´´´
info
guix search xxx
guix package --list-installed
guix package --list-profiles
guix package --search-paths. List recommended environment variables

update
guix pull
guix upgrade

install
guix show xxx
guix install xxx
guix remove xxx

manifest
guix package --export-manifest     → this can be saved in git repo.
guix package --manifest=flo.scm       -> import packages from manifest

Example manifest:
(specifications->manifest '("emacs" "frozen-bubble" "git"))

´´´

Make your own package:
https://gitlab.com/pjotrp/guix-notes/-/blob/master/GUIX-SIMPLE-PACKAGE.org




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

1:17 AM <dftxbs3e> ~/src/guix [env]$ find . -name '*zsh*'
1:17 AM <dftxbs3e> ./etc/completion/zsh

1:37 AM <terpri> see (info "(guix) Inferiors")
1:38 AM <dftxbs3e> inferiors can reference any channel or older versions of GNU Guix (up to a certain point because it needs support code in the version you try to use I think)

# build systems

maven:
https://maven.apache.org/configure.html
 -Xmx2048m -Xms1024m -XX:MaxPermSize=512m -Djava.awt.headless=true
 <maven.compiler.source>1.7</maven.compiler.source>

https://guix.gnu.org/manual/en/html_node/Build-Systems.html
- ant-build-system java
  adds: ant
        Java Development Kit (JDK) 
   as provided by the icedtea package to the set of inputs. 
  Different packages can be specified with the #:ant and #:jdk parameters, respectively.

- clojure-build-system
  extension of ant-build-system, 
  Different packages can be specified with the 
       #:clojure
       #:jdk
       #:zip
       #:aot-include
       #:aot-exclude
       #:omit-source?
       #%main-class

- maven-build-system
    You can override the default jdk and maven packages with the  
    #:jdk
    #:maven.


- python-build-system
   http://guix-website-test.cbaines.net/en/packages/python-pip-20.0.2/
   https://yhetil.org/guix-user/1701167f4c3.e4e64c8a25038.4576513321829582679@zoho.com/T/


- r-build-system
    https://www.bioconductor.org/
    Bioconductor uses the R statistical programming language

- node-build-system
    Which Node.js package is used to interpret the npm commands can be 
    specified with the #:node parameter which defaults to node.


    https://github.com/leibniz-psychology/psychnotebook-deploy/blob/master/src/zpid/machines/yamunanagar/cron.scm

    https://github.com/leibniz-psychology/psychnotebook-deploy/blob/master/src/zpid/machines/yamunanagar/ci.scm

# os tweaking

(define-module (zeus)
  #:use-module (base-system)
  #:use-module (gnu))

(operating-system
 (inherit base-operating-system)
 (host-name "zeus")
;;; Specific customisations for this system
)

# package tweaking

Package inheritance makes it very easy to customize packages with a patch, for instance

guix build --with-input=guile=guile@2.0 guix

https://guix.gnu.org/manual/en/html_node/Package-Transformation-Options.html

https://guix.gnu.org/manual/en/html_node/Derivations.html



https://guix.gnu.org/manual/en/html_node/package-Reference.html

 let ((toolchain (specification->package "gcc-toolchain@10")))
  
  (package-with-c-toolchain 
     hello `(
               ("toolchain" ,toolchain)
            )))


(transform-package-toolchain replacement-specs)
list of strings like \"fftw=gcc-toolchain@10\"


Florian Hoertlehner, [14.02.21 14:25]
11:05 AM <ngz> yoctocell: #f not f

Florian Hoertlehner, [14.02.21 14:25]
11:05 AM <ngz> #f (or #false) and #t (or #true) are the booleans

Florian Hoertlehner, [14.02.21 14:26]
11:20 AM <ngz> guix archive --authorize < PREFIX/share/guix/ci.guix.gnu.org.pub per manual

Florian Hoertlehner, [14.02.21 14:26]
11:19 AM <ngz> You didn't authorize substitutes

Florian Hoertlehner, [14.02.21 14:27]
11:20 AM <ngz> where PREFIX is the Guix installation prefix.

Florian Hoertlehner, [14.02.21 14:28]
11:48 AM <mdevos> (btw. apparently the configuration directory can be overriden by setting the GUIX_CONFIGURATION_DIRECTORY environment variable)

Florian Hoertlehner, [14.02.21 14:28]
11:47 AM <mdevos> yoctocell: could you run "guix repl", and evaluate (@ (guix config) %config-directory) there?  I wonder if nix configures guix incorrectly

https://medium.com/swlh/guix-packaging-by-example-6e44ba693fb2



 guix gc --delete-generations=1m

Search paths will suggest a Guix enviroment, e.g.
guix package --search-paths

(define-public libnode
  (package
    (inherit node)
    (name "libnode")
    (arguments
     (substitute-keyword-arguments (package-arguments node)
       ((#:configure-flags flags ''())
        `(cons* "--shared" "--without-npm" ,flags))
       ((#:phases phases '%standard-phases)
        `(modify-phases ,phases
           (delete 'patch-npm-shebang)))))))

           