(define-module (gorilla tweak-node)
  #:use-module (guix packages)
  #:use-module (guix profiles)
  #:use-module (gnu packages)
  #:use-module (gnu packages node)
  #:use-module (ice-9 pretty-print)
  #:export (libnode))

; to see sourcecode of node package:
; guix edit node 

(define-public libnode
  (package
    (inherit node)
    (name "libnode")
    (arguments
     (substitute-keyword-arguments (package-arguments node)
       ((#:configure-flags flags ''())
        `(cons* "--shared" "--without-npm" ,flags))))))


; to test:
; guix repl ./scm/gorilla/tweak-node.scm

(display "original \n")
(display node)

(display "tweaked \n")
(display libnode)
(pretty-print libnode)
