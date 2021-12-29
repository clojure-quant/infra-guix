
a mirror of guix source on github
https://github.com/guix-mirror/guix

search for guix irc chat
http://logs.guix.gnu.org/guix/search?query=trezord

issues
https://issues.guix.gnu.org/

mailing list
https://lists.gnu.org/archive/html/help-guix/

ci build farm
https://ci.guix.gnu.org/search?query=node-14.18.1

# Docs
https://archive.fosdem.org/2020/schedule/event/guix/attachments/slides/3931/export/events/attachments/guix/slides/3931/guix_unifying.pdf
https://guix.gnu.org/manual/en/guix.html#The-Perfect-Setup
http://guix.gnu.org/cookbook/en/guix-cookbook.html
https://git.sr.ht/~lle-bout/awesome-guix#awesome-guix
https://github.com/pjotrp/guix-notes/blob/master/HACKING.org
https://ambrevar.xyz/guix-advance/
https://notabug.org/civodul/guix-explorer guix system explorer graph:

# Directories
ls /gnu/store
cat  ~/.config/guix/current/etc/profile       bash env variables
ls  ~/.guix-profile/bin                              installed binaries

~/.guix-profile                    the default user profile
~/.config/guix/current         profile, populated by guix pull
/var/guix/profiles/system

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

# system configuration examples

https://github.com/daviwil/dotfiles/blob/master/Systems.org#base-configuration
https://github.com/Millak/guix-config/blob/master/Guix_manifest.scm
https://framagit.org/tyreunom/system-configuration

guix build farm config:
https://git.savannah.gnu.org/cgit/guix/maintenance.git/tree/hydra/berlin.scm

nice config, machine/environment dependnet
https://git.sr.ht/~efraim/guix-config/tree/master/item/efraim-home.scm 

https://github.com/dustinlyons/guix-config/blob/main/Workstation-Desktop.org
https://github.com/daviwil/dotfiles/blob/master/Systems.org


(define headless?
  (eq? #f (getenv "DISPLAY")))

  (define work-machine?
  (not (eq? #f (member (gethostname)
                       (cons "bayfront"
                             UTenn_machines)))))
(define guix-system
  (file-exists? "/run/current-system/provenance"))

# GUIX SYSTEM ADMIN

1m = 1 month
guix gc --delete-generations=1m

guix home delete-generations
guix package --delete-generations

sudo guix package --list-generations
guix package --profile=$HOME/.config/guix/current --list-generations
guix package --profile=$HOME/.config/guix/current --delete-generations
If you want to "act as root", you have to do `sudo --login foo`
Remember, `guix pull` is per user. That means that each user have their own Guix and they can manage it independently

sudo --login guix describe


# herd

sudo herd status
sudo herd detailed-status                 ; shows status of all services

sudo herd schedule mcron                  ; show next 5 scheduled runtimes.
sudo herd schedule mcron 10               ; next 10 scheduled runtimes
sudo herd restart mcron

herd doc nscd
sudo herd doc udev list-actions

herd detailed-status
herd status
herd start syncthing

# home

cat /home/florian/.local/var/log/shepherd.log



# profiles

Goal: create byte identical profiles over time that are not only shared between machines (important for deployment) but also between developers. 
Development, testing, staging, production - essentially these are all profiles!

guix package -i sambamba -p ~/opt/sambamba
Guix provides a profile file which contains the necessary shell settings into the environment
cat ~/opt/sambamba/etc/profile


For trying things out, I recommend using `guix environment --ad-hoc foo`
That way, your profile history does not contain the thing that you just wanted to try out, so `guix gc` can work more efficiently


 probably because GIT_EXEC_PATH is unset (did you try logging out and in again?)
<xelxebar>	mbakke: Oh. It's set, but to the wrong thing :/
<mbakke>	huh
<xelxebar>	For some reason it's getting set to $HOME/.config/guix/current/libexec/gi