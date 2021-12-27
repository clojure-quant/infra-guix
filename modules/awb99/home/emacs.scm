(define-module (awb99 home emacs)
  #:use-module (guix gexp)
  #:use-module (guix transformations)
  #:use-module (gnu packages)
  #:use-module (gnu packages emacs) ; emacs-next-pgtk
  #:use-module (rde packages)
  #:use-module (gnu home services)
  #:use-module (gnu home-services emacs) ; emacs-next-pgtk-latest
  #:use-module (gnu home-services-utils)
  #:use-module (awb99 packages emacs)
)

; stolen from: https://git.sr.ht/~krevedkokun/dotfiles/tree/master/item/home/yggdrasil/emacs.scm

(define transform
(options->transformation
 '((with-commit . "emacs-use-package=a7422fb8ab1baee19adb2717b5b47b9c3812a84c"))))

(define emacs-packages2
  ; (map (compose transform specification->package)
  (map specification->package emacs-packages))

(define-public emacs-services
  (list
    (service home-emacs-service-type
      (home-emacs-configuration
        ;(package emacs-next-pgtk-latest) ; emacs package for wayland latest does not have substitutes
        (package emacs-next-pgtk) ; emacs package for wayland  
        (rebuild-elisp-packages? #t)
        (init-el
          `(,(slurp-file-gexp (local-file "../../../home/emacs/init.el"))))
        (elisp-packages emacs-packages2)))))