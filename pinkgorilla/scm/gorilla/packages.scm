(define-module (gorilla packages)
  ;#:use-module (gorilla guixutils)
  #:export (p-linux
            p-clojure 
            p-python 
            p-services 
            p-desktop
            p-notebook
            ))



(define p-linux 
  (list "xdot"
        "wget"
        "git"
        "ncdu"
        "ncurses" ; clear
        "glibc-locales"
       
        "rclone"
        "idutils"
        
        "coreutils"
        "bash"
        "guile" 
        "hello"
  ))

(define p-clojure 
  (list "icedtea"   ; open-jdk java
        "leiningen" ; nongnu downloads java-8 jar from github repo, v 2.9.5
        "clojure"   ; from gnu guix
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
(define p-r
  (list ;; for RMarkdown
   ;"r-knitr"
   ;"r-yaml"
   ;"r-markdown"
   ;"r-rmarkdown"
   "texlive"
   ;; commonly used r packages
   "r-psych"
   "r-ggplot2"
   "r-lattice"
   "r-foreign"
   "r-readr"
   "r-haven"
   "r-dplyr"
   "r-tidyr"
   "r-stringr"
   "r-forecast"
   "r-lme4"
   "r-nlme"
   "r-nnet"
   "r-glmnet"
   "r-caret"
   "r-xmisc"
   "r-splitstackshape"
   "r-tm"
   "r-quanteda"
   "r-topicmodels"
   "r-stm"
   ;;"r-parallel"
   "r-dt"
   "r-nlp"
   ))

(define p-services 
  (list  "shepherd"
         "mcron"
         "syncthing"
  ))

(define p-desktop 
  (list "syncthing-gtk" 
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
         ; services
         ; desktop       
        )
)
