(define-module (awb99 packages emacs))
      
(define-public emacs-packages
  (list
   ; emacs app
   "emacs"
 ; "emacs-next"

   ; default packages
   "emacs-which-key"
   "emacs-rainbow-delimiters"
   "emacs-posframe" ; required by treemacs which requires cfrs
   "emacs-treemacs"
   "emacs-magit"
   "emacs-vterm"
 ;  "emacs-evil"
   "emacs-ag" ; ag search (dired)
   "emacs-projectile" ; made by bbastsov
   
   ; clojure
   "emacs-clojure-mode"
   "emacs-cider"
   "emacs-anakondo"
   "emacs-helm-cider"

   ; markdown
   "emacs-markdown-mode"
   "emacs-markdown-preview-mode"
   
   ;"emacs-paredit"

   ;"emacs-modus-themes" ; themes for better readability
   ;"emacs-consult" ; completion functions
;  "emacs-orderless" ; multiple regex match
  
;  "emacs-which-key" ; displays incomplete keybindings
;  "emacs-eros" ; eval result overlays
;  "emacs-gcmh" ; garbage collector magic hack
  ; "emacs-minions" ; minor mode menu
;  "emacs-async"
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
;  "emacs-erc-image"
;  "emacs-erc-hl-nicks"
  
 ; "emacs-geiser"
 ; "emacs-geiser-guile"
 ; "emacs-magit"
  ;"emacs-geiser-eros"
  ;"emacs-flymake-kondor"
  ;"emacs-use-package"
 ; "emacs-envrc"
 ; "emacs-mini-frame"
 ; "emacs-embark" ; right click context menu
  ;"emacs-sly" ; common lisp repl
  
  ;"emacs-notmuch"
;  "emacs-vertico" ; vertical completion
 ; "emacs-corfu" ; completion in region
 ; "emacs-polymode-org"
 ; "emacs-org-appear"
  ;"emacs-git-email-fix"
  ;"emacs-org-roam"
  ;"emacs-avy"
  ;"emacs-ace-window"
  ;"emacs-telega"
  ;"emacs-refactor"
  ;"emacs-flycheck-package"
  ; prelude: bosidar keybindings directly.

 )
    )



