(define-module (awb99 helper)
  #:use-module (gnu packages)
  #:export (->packages-output))


(define (->packages-output specs)
  (map specification->package+output specs))

(define headless?
  (eq? #f (getenv "DISPLAY")))

(define UTenn_machines
  (list "lily"
        "penguin2"
        "tux01"
        "tux02"
        "tux03"
        "octopus01"))

(define guix-system?
  (file-exists? "/run/current-system/provenance"))

(define work-machine?
(not (eq? #f (member (gethostname)
                     (cons "bayfront"
                           UTenn_machines)))))

(define %logdir
 (or (getenv "XDG_LOG_HOME")
     (format #f "~a/.local/var/log"
       (getenv "HOME"))))

