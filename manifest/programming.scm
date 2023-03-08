(use-modules
 (awb99 guixutils)  
 (awb99 packages programming)
 ; (awb99 package babashka)
 )

; babashka now comes from nix

;(define bin-packages
;  (packages->manifest 
;    (list
;      ; babashka
;      )))

(define-public programming-packages
  (specifications->manifest
    (append 
      clojure-packages
      ; node-packages
      ; python-packages
      ; r-packages
      ; build-packages
    )))


;(append
;  bin-packages
;   programming-packages)

programming-packages
