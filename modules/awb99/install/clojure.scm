(define-module (awb99 install clojure)
  #:export (my-clojure))

(define my-clojure
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
      
    ;"clojure-tools-cli"  ; guix version (OLD)
    ;"clojure"   ; from gnu guix  this is old.  brings clojure
    "clojure-tools" ; nongnu version brings clj and clojure
    ; "leiningen" ; nongnu 
    ; channel gorilla (prior: guiliani)
    "babashka" 
      
    "node" ; v10, v14 is in development. brings node and npm
    ; "java-certs" ; why?
    "graphviz" ;  dependency graphs

      
   ))
