;  #:use-module (oop goops)  ; Defining classes and methods.
;  #:use-module (shepherd service) ; service
  

(define scli
   '("syncthing" 
     "-no-browser"
     "-logflags=3" ; prefix with date & time
     "-logfile=/home/florian/log/syncthing.log"))


(define sbash
 (list "bash" "-c"
       "syncthing -no-browser -logflags=3 -logfile=/home/florian/log/syncthing.log 2>&1 | logger --tag=darkman"))


(define syncthing
  (make <service>
    #:provides '(syncthing)
    #:docstring "Run `syncthing' without calling the browser"
    #:start (make-forkexec-constructor
              ; scli
              sbash
              )
    #:stop (make-kill-destructor)
    #:respawn? #t))

(register-services syncthing)

(start syncthing)