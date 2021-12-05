(define-module (awb99 config guix-daemon)
  #:use-module (guix gexp)
  #:use-module (gnu services base)
  #:export (;%guix-configuration
            %substitute-urls
            ;%authorized-keys
            ;%extra-options
            ))

(define %substitute-urls
  (list "https://ci.guix.gnu.org"
        ;"http://bp7o7ckwlewr4slm.onion" ; ci.guix.gnu.org
        "https://bayfront.guix.gnu.org"
        "https://bordeaux.guix.gnu.org"
        "http://guix.genenetwork.org"
        "https://guix.tobias.gr"))
