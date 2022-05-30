(define-module (awb99 packages programming))

(define-public clojure-packages
  (list 
    ;"icedtea"   ; open-jdk java
    ;"openjdk"
    ;(list "openjdk" "jdk" "doc" "out")
    ;"openjdk:doc"  ; doc output of openjdk - needed by cider/orchard
    "openjdk:jdk" ; having first openjdk does not work.s
    "fastjar" ; java "jar" app
    "java-qdox" 
    "java-swt"
    "rlwrap"
    
    ;"clojure-tools" ; nongnu version brings clj and clojure
    ; "clojure-tools-deps-alpha" ; nongnu version - clojure-tools already brings this.
    ; "clojure-tools-cli" ; guix version (OLD)
     "clojure"   ; from gnu guix  this is old.  brings clojure (OLD)
    ; "leiningen" ; nongnu downloads java-8 jar from github repo, v 2.9.5
   
   ; "graphviz" ;  dependency graphs
    "babashka" ; channel gorilla
    "certbot" ; letsencrypt certs
    "git"
  ))


(define-public node-packages
  (list 
    "node" ; v10, v14 is in development. brings node and npm
   ))


(define-public python-packages
  (list 
    ; possibly add this channel too ?
    ; https://github.com/UMCUGenetics/guix-additions/blob/master/umcu/packages/python.scm
    ; https://unix.stackexchange.com/questions/621269/use-a-python-projects-requirements-txt-as-input-to-a-guix-package-definition?rq=1
    "python"  
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
    "python-yarl" ; for edgar
    "python-certifi"
    "python-tqdm"
    "python-lxml"
    "python-soupsieve"
    "python-urllib3"
    "python-beautifulsoup4"
    "python-async-timeout"
    "python-chardet"
    "python-requests" 
    "python-typing-extensions"
    "python-attrs"
    "python-aiohttp"
  
    "python-yubikey-manager"
    ;"rofi-pass"
    ;"rofi"
    ;"python-yubikey-oath-dmenu"
   ))



(define-public r-packages
  ; possibly add this channel too ?
  ; https://github.com/UMCUGenetics/guix-additions/blob/master/umcu/packages/rstudio.scm
  ; r repos: Bioconductor + Cran
  (list ;; for RMarkdown
    "r"
    "r-rserve" ; tcp server adaptor
    ; "rstudio" ; channel guix-science
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


(define-public build-packages
  (list 
    "coreutils" ; glibcc gcc bash 
    ;"direnv" google this
      
    ;"idutils"
    ; "guile" 
    "hello"
    ;"nss-certs" ; tls certificates
       
    "make"
    "gcc-toolchain"
    ; "llvm" "clang" "clang-runtime" "clang-toolchain"
    ; "glibc" "gdb" "gcc-toolchain"
    ; "gnu-make" "cmake" "pkg-config"
    ; "patchelf" "binutils" "elfutils"
  ))


; another approach
; this is perhaps better, as I dont need manifest+os
; guix environment -l guix-requirements.scm.
;https://unix.stackexchange.com/questions/621269/use-a-python-projects-requirements-txt-as-input-to-a-guix-package-definition?rq=1

; or this: package reprocessing
; https://github.com/alezost/guix-config/blob/master/modules/al/guix/utils.scm



