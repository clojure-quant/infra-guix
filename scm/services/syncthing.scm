(define-module (services syncthing))

; https://guix.gnu.org/blog/2020/gnu-shepherd-user-services/

(use-modules ;(guix) 
  ;(gnu)
  ;(gnu build shepherd)
  (oop goops)      ;; Defining classes and methods.

(shepherd)
  (shepherd config)
   (shepherd support)
    (shepherd service)
   (shepherd system)
   (shepherd args)
   (shepherd comm)

  ;(gnu services mcron)
  )


;(use-package-modules base idutils)

(define syncthing
  (make <service>
    #:provides '(syncthing)
    #:docstring "Run `syncthing' without calling the browser"
    #:start (make-forkexec-constructor
              '("syncthing" "-no-browser"
                "-logflags=3" ; prefix with date & time
                "-logfile=/home/user/log/syncthing.log"))
    #:stop (make-kill-destructor)
    #:respawn? #t))

(register-services syncthing)

(start syncthing)
