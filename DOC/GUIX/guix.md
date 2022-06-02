
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