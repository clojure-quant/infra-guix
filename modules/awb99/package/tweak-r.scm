(define-module (awb99 tweak-r)
  #:use-module (guix packages)
  #:use-module (guix profiles)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages statistics)
  #:export (r-maximal))


(define-public r-maximal
  (package
    (inherit r-minimal)
    (name "r-maximal")
    (arguments
     (substitute-keyword-arguments (package-arguments r-minimal)
       ((#:configure-flags flags)
        `(cons "--enable-R-shlib" ,flags))))))


; export R_HOME=$(guix build r-minimal)/lib/R guix environment --ad-hoc r-rserve -- Rserve