(define-module (home-config keepassxc)
#:use-module (home)
#:use-module (home keepassxc)
#:export (keepassxc-home))

(define keepassxc-home
(user-home keepassxc-home-type
  (keepassxc-configuration
    (last-databases '("/data/tyreunom/ownCloud/synchro/pass.kdbx"))
    (last-dir "/data/tyreunom")
    (last-opened-databases '("/data/tyreunom/ownCloud/synchro/pass.kdbx"))
    (theme "dark")
    (browser-integration? #t))))
