(define-module (awb99 home emacs)
  #:use-module (guix gexp)
  #:use-module (guix transformations)
  #:use-module (gnu packages)
  #:use-module (gnu packages emacs) ; emacs-next-pgtk
  #:use-module (rde packages)
  #:use-module (gnu home services)
  #:use-module (gnu home-services emacs) ; emacs-next-pgtk-latest
  #:use-module (gnu home-services-utils))

; stolen from: https://git.sr.ht/~krevedkokun/dotfiles/tree/master/item/home/yggdrasil/emacs.scm

(define transform
(options->transformation
 '((with-commit . "emacs-use-package=a7422fb8ab1baee19adb2717b5b47b9c3812a84c"))))



(define-public emacs-packages
; (map (compose transform specification->package)
(map specification->package
     '(
       "emacs-orderless" ; multiple regex match
       "emacs-modus-themes" ; themes for better readability
       "emacs-which-key" ; displays incomplete keybindings
       "emacs-eros" ; eval result overlays
       "emacs-gcmh" ; garbage collector magic hack
       "emacs-minions" ; minor mode menu
       "emacs-async"
       ;"emacs-marginalia"
  ;     "emacs-rg" ; rip-grep
   ;    "emacs-nov-el" ; ebook reader
      ; "emacs-pdf-tools"
      ; "emacs-eglot"
      ; "emacs-docker"
      ; "emacs-dockerfile-mode"
      ; "emacs-docker-compose-mode"
      ; "emacs-restclient"
      ; "emacs-macrostep"
       ;"emacs-csv-mode"
       ;"emacs-consult" ; completion functions
       "emacs-project"
     ;  "emacs-erc-image"
     ;  "emacs-erc-hl-nicks"
       "emacs-clojure-mode"
       "emacs-cider"
       "emacs-geiser"
       "emacs-geiser-guile"
       "emacs-magit"
       ;"emacs-geiser-eros"
       ;"emacs-flymake-kondor"
       "emacs-use-package"
       "emacs-envrc"
       "emacs-mini-frame"
       "emacs-embark" ; right click context menu
       ;"emacs-sly" ; common lisp repl
       "emacs-paredit"
       "emacs-notmuch"
       "emacs-vertico" ; vertical completion
       "emacs-corfu" ; completion in region
      ; "emacs-polymode-org"
      ; "emacs-org-appear"
       ;"emacs-git-email-fix"
       ;"emacs-org-roam"
       ;"emacs-avy"
       ;"emacs-ace-window"
       ;"emacs-telega"
      )))

(define-public emacs-services
  (list
    (service home-emacs-service-type
      (home-emacs-configuration
        ;(package emacs-next-pgtk-latest) ; emacs package for wayland latest does not have substitutes
        (package emacs-next-pgtk) ; emacs package for wayland  
        (rebuild-elisp-packages? #t)
        (init-el
          `(,(slurp-file-gexp (local-file "../../../home/emacs/init.el"))))
        (elisp-packages emacs-packages)))))