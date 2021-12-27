(define-module (awb99 ptest))

(use-modules 
  (gnu)
  (awb99 packages nuc)
  (awb99 guixutils) 

)


(define-public graph-packages
  (map specification->package 
    desktop-tool-packages)
)


;(define my-packages
;(append
;  (specifications->package packages-desktop-nuc)
;  %base-packages))
