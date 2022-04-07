
# Channels (repositories)

A channel is a git repo that defines packages in scheme files that can be built.
https://gitlab.com/pjotrp/guix-notes/-/blob/master/CHANNELS.org

guix describe                shows installed repositories  
cat  ~/.config/guix/channels.scm             config file for custom channels
cat  ~/.config/guix/current/manifest         shows all channels

By default guix pull
reads ~/.config/guix/channels.scm; with -C it can take channel specifications from a user-supplied file 

- **Nonguix** https://gitlab.com/nonguix/nonguix clojure steam broadcom installer nonfree 
- **Nonfree**  https://www.rohleder.de/gitweb/?p=guix.git;a=blob;f=mroh/guix/install.scm;hb=HEAD wifi driver, qemu, steem
- **guix science** https://github.com/guix-science/guix-science
- **pantherX** https://channels.pantherx.org/pantherx-extra.git/tree/
- **Bio informatics** https://github.com/pjotrp/guix-notes/blob/master/BIOINFORMATICS.org r shiny cran java node shell python2 python3 machine learning tensor flow mysql numpy services: shiny
- **Gaming** https://gitlab.com/guix-gaming-channels
- **RStudio** https://github.com/leibniz-psychology/guix-zpid rstudio
- **Guix past** https://gitlab.inria.fr/guix-hpc/guix-past old Python versions
- https://gitlab.inria.fr/guix-hpc/guix-hpc-non-free cuda mkl 
- https://gitlab.inria.fr/guix-hpc/guix-hpc
- https://gitlab.com/mbakke/guix-chromium
- https://github.com/UMCUGenetics/guix-additions/tree/master/umcu/packages
- https://framagit.org/tyreunom/guix-more/-/tree/master/more/packages virtualbox intelij
