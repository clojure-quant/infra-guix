
# system configuration examples

https://github.com/daviwil/dotfiles/blob/master/Systems.org#base-configuration
https://github.com/Millak/guix-config/blob/master/Guix_manifest.scm
https://framagit.org/tyreunom/system-configuration

guix build farm config:
https://git.savannah.gnu.org/cgit/guix/maintenance.git/tree/hydra/berlin.scm

nice config, machine/environment dependent
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
