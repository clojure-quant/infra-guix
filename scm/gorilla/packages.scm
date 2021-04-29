(define-module (gorilla packages)
  #:export (p-notebook
            p-dev
            ))

(define p-linux 
  (list "coreutils" ; glibcc gcc bash 
       ;"glibc-locales" ; all supported gnu clib locales (1 gig)
       "glibc-utf8-locales" ; small set of locales
       ;"direnv" google this
       "the-silver-searcher" ; ag
       "iputils" ; ping
        "bash"
        "zsh"
        "zsh-autosuggestions"
        "fish"
        "less" ; needed by fish history
        "which" ; needed by clojisr in --pure environment
        "grep" ; needed by byobu
        "sed" ; needed by byobu
        "tmux" ; needed by byobu
        "byobu" ; tmux with better config
        "wget"
        "curl"
        "openssh" ; required for git with ssh repos
        "git"
        "ncdu"
        "ncurses" ; clear
        "rclone"
        ;"idutils"
        "guile" 
        "hello"
  ))

(define p-clojure 
  (list "icedtea"   ; open-jdk java
        "fastjar" ; java "jar" app
        "leiningen" ; nongnu downloads java-8 jar from github repo, v 2.9.5
        "clojure"   ; from gnu guix
        "ungoogled-chromium"  ; karma js unit tests
  ))

; possibly add this channel too ?
; https://github.com/UMCUGenetics/guix-additions/blob/master/umcu/packages/python.scm
(define p-python 
  (list "python"  
        ;"python-2"
        ;   "python-wrapper"
       ; "python-cython"
       ;"python-future"
       ;"python-h5py" 
       ;"python-mappy"
       "python-numpy" 
       "python-scipy" 
       "python-pandas"
       ;"python-setuptools
  ))

; possibly add this channel too ?
; https://github.com/UMCUGenetics/guix-additions/blob/master/umcu/packages/rstudio.scm
; r repos: Bioconductor + Cran
(define p-r
  (list ;; for RMarkdown
    "r"
    "r-rserve" ; tcp server adaptor
   ;"r-knitr"
   ;"r-yaml"
   ;"r-markdown"
   ;"r-rmarkdown"
   ;"texlive"
   ;; commonly used r packages
   ;"r-psych"

   ; clojisr goldly-example-datascience
   "r-ggplot2" 
   "r-dt"
   "r-svglite"
   "r-plotly"
   
   "r-lattice"
   "r-foreign"
   "r-readr"
   ;"r-haven"
   "r-dplyr"
   "r-tidyr"
   ;"r-stringr"
   ;"r-forecast"
   ;"r-lme4"
   ;"r-nlme"
   ;"r-nnet"
   ;"r-glmnet"
   ;"r-caret"
   ;"r-xmisc"
   ;"r-splitstackshape"
   ;"r-tm"
   ;"r-quanteda"
   ;"r-topicmodels"
   ;"r-stm"
   ;;"r-parallel"
   ;"r-nlp"
   ))

(define p-node 
  (list "node" ; v10, v14 is in development. brings node and npm
  ))

(define p-services 
  (list  "shepherd"
         "mcron"
         "syncthing"
  ))

(define p-desktop 
  (list "xdot" ; graphviz .dot viewer needed for guix graph
        "syncthing-gtk" 
        "ranger" ; directory explorer
        "mc"
        "glances"
        "htop"
        "emacs"
        "emacs-spacemacs-theme"
        "neovim"
        "xclock" ;x test
        "libreoffice"  ; libreoffice
  ))


; another approach
; this is perhaps better, as I dont need manifest+os
; guix environment -l guix-requirements.scm.
;https://unix.stackexchange.com/questions/621269/use-a-python-projects-requirements-txt-as-input-to-a-guix-package-definition?rq=1

; or this: package reprocessing
; https://github.com/alezost/guix-config/blob/master/modules/al/guix/utils.scm


(define p-notebook
    (append 
       p-linux
       p-clojure
       p-python
       p-r
       p-node
         ; services
         ; desktop       
        ))

(define p-dev
    (append 
       p-notebook
       p-desktop     
        ))
