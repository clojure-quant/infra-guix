(define-module (gorilla guixutils) 
  #:use-module (guix packages)
  #:use-module (guix profiles)
  #:use-module (gnu packages)
  #:export (->manifests
            ->packages
            ))

(define (->packages specs)
    (map specification->package specs))

(define (->manifests specs)
    (packages->manifest (->packages specs)))
    
    
    