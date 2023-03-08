(use-modules
 (awb99 guixutils)  
 (awb99 packages programming)
 (awb99 package babashka)
 )

(define bin-packages
  (packages->manifest 
    (list
      ; babashka
      )))

(define-public programming-packages
  (specifications->manifest
    (append 
      clojure-packages
      ; node-packages
      ; python-packages
      ; r-packages
      ; build-packages
    )))


(append
  bin-packages
   programming-packages)
