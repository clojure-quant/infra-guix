(define-module (awb99 helper)
  #:use-module (gnu packages)
  #:export (->packages-output))


(define (->packages-output specs)
  (map specification->package+output specs))

(define guix-system?
(file-exists? "/run/current-system/provenance"))

(define headless?
  (eq? #f (getenv "DISPLAY")))

(define UTenn_machines
  (list "lily"
        "penguin2"
        "tux01"
        "tux02"
        "tux03"
        "octopus01"))



(define work-machine?
(not (eq? #f (member (gethostname)
                     (cons "bayfront"
                           UTenn_machines)))))

(define %logdir
 (or (getenv "XDG_LOG_HOME")
     (format #f "~a/.local/var/log"
       (getenv "HOME"))))

(define* (getenv* nam #:optional default)
    "Like `getenv' but returns DEFAULT if NAM is not found."
    (or (getenv nam)
        default))
  
