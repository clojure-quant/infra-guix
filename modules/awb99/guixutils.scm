(define-module (awb99 guixutils) 
  #:use-module (gnu)
  #:use-module (guix packages) 
  #:use-module (guix profiles)
  #:use-module (gnu packages) ; specification->package
  #:export (->manifests
            ->packages
            ->packages-output
            specifications->package
            ))

(define (->packages specs)
    (map specification->package specs))

(define (->manifests specs)
    (packages->manifest (->packages specs)))
    

(define (->packages-output specs)
  (map specification->package+output specs))

(define (specifications->package specs)
  (map specification->package specs))

; The use of specification->package+output allows the specification "transmission:gui" to work. 
; It is necessary to use the compose and list procedures also in this manner, 
; because specification->package+output is a procedure which returns multiple values

;(packages->manifest
;(map (compose list specification->package+output)
;     '("abbaye"
;       "transmission:gui"
;       "youtube-dl")))
