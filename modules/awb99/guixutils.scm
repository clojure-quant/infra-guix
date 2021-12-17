(define-module (awb99 guixutils) 
  #:use-module (gnu)
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
    
    
    