
a mirror of guix source on github
https://github.com/guix-mirror/guix

search for guix irc chat
http://logs.guix.gnu.org/guix/search?query=trezord

issues
https://issues.guix.gnu.org/

mailing list
https://lists.gnu.org/archive/html/help-guix/

# Docs
https://archive.fosdem.org/2020/schedule/event/guix/attachments/slides/3931/export/events/attachments/guix/slides/3931/guix_unifying.pdf
https://guix.gnu.org/manual/en/guix.html#The-Perfect-Setup
http://guix.gnu.org/cookbook/en/guix-cookbook.html
https://git.sr.ht/~lle-bout/awesome-guix#awesome-guix
https://github.com/pjotrp/guix-notes/blob/master/HACKING.org
https://framagit.org/tyreunom/guix-home-manager
https://ambrevar.xyz/guix-advance/

Guix patches: more up to date packages 
https://git.guix-patches.cbaines.net/guix-patches/?h=base 
patches are added via https://issues.guix.gnu.org/

# Directories
ls /gnu/store
cat  ~/.config/guix/current/etc/profile       bash env variables
ls  ~/.guix-profile/bin                              installed binaries

~/.guix-profile                    the default user profile
~/.config/guix/current         profile, populated by guix pull
/var/guix/profiles/system



# GUIX SYSTEM ADMIN

* system
guix system describe
guix system list-generations               ; system profile

* user
guix describe                             ; shows installed repositories
guix profile --list-generations            ; user profile


1m = 1 month
guix gc --delete-generations=1m


https://www.amazon.de/TP-Link-T2U-Dualband-adapter-compatible/dp/B07P681N66/ref=mp_s_a_1_8?crid=3LLZWSTR1OEXG&keywords=TP-Link+Archer+T2+U%2B+TP-Link+AC600&qid=1638763611&sprefix=tp-link+archer+t2u+plus+tp-link+ac600%2Caps%2C137&sr=8-8



look at the output of dmesg.

https://github.com/tycrek/degoogle

https://www.chezmoi.io/





https://ambrevar.xyz/guix-advance/

https://github.com/daviwil/dotfiles/blob/master/Systems.org#base-configuration


https://github.com/Millak/guix-config/blob/master/Guix_manifest.scm


        ; AWS
        ; https://cloudinit.readthedocs.io/en/stable/
        ; # guix package: cloud-utils    has cloud-init
        ; Guile AWS for AWS backend.


guix build farm config:
https://git.savannah.gnu.org/cgit/guix/maintenance.git/tree/hydra/berlin.scm



(define headless?
  (eq? #f (getenv "DISPLAY")))

  (define work-machine?
  (not (eq? #f (member (gethostname)
                       (cons "bayfront"
                             UTenn_machines)))))

(define guix-system
  (file-exists? "/run/current-system/provenance"))
  
                          