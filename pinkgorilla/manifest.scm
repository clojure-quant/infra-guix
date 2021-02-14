;; guix package -m ./manifest.scm

(define linux 
  (list  "xdot"
        "wget"
        "git"
        "ncdu"
        "ncurses"
        "glibc-locales"
       
        "rclone"
        "idutils"
        
        "coreutils"
        "bash"
        "guile" 
        "hello"
  ))

(define clojure 
  (list "icedtea"   ; open-jdk java
        "leiningen" ; nongnu downloads java-8 jar from github repo, v 2.9.5
        "clojure"   ; from gnu guix
  ))

(define r
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

(define services 
  (list  "shepherd"
         "mcron"
         "syncthing"
  ))

(define desktop 
  (list "syncthing-gtk" 
  ))


(specifications->manifest
 (append linux
         clojure
         ; services
         ; desktop       
        ))
