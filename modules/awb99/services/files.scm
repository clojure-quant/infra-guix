(define-module (awb99 services files)
  #:use-module (oop goops)  ; Defining classes and methods.
  #:use-module (gnu) 
  ; #:use-module (guix gexp)
  #:export (service-files)
  )



(define service-files
;; this creates /etc/os-release file
(simple-service 
  'my-files 
  etc-service-type
  `(("rock1.scm" ,(local-file "../../../machine/rock1.scm")))))  ; relative this file



