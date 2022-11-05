(define-module (awb99 helper)
  #:use-module (gnu packages)
  #:export (->packages-output))


(define (->packages-output specs)
  (map specification->package+output specs))