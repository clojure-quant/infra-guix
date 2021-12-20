(define-module (awb99 services clojure))

  
(use-modules 
  (gnu)
  (guix)
  (guix gexp)
  (oop goops)  ; Defining classes and methods.
  (shepherd service) ; service
)


(define scli
'("clj" 
  "-X:goldly-docs"))

(define sbash
  (list "bash" "-c"
      "syncthing -no-browser -logflags=3 -logfile=/home/florian/log/syncthing.log 2>&1 | logger --tag=darkman"))


;(define goldly
;  (make <service>
;    #:provides '(syncthing)
;    #:docstring "Run `syncthing' without calling the browser"
;    #:start (make-forkexec-constructor
;              ; scli
;              sbash
;              )
;    #:stop (make-kill-destructor)
;    #:respawn? #t))

;(register-services syncthing)
;(start syncthing)


(define goldly-service
  (shepherd-service
    (provision '(redshift))
    (requirement '(xorg-server))
    (documentation "Start Redshift as a service")
    (start #~(make-forkexec-constructor
          `("redshift" "-l" ,evry-geolocation)))
    (stop #~(make-kill-destructor))))

(simple-service 'goldly-service 'shepherd-root-service-type 
(list redshift-service))