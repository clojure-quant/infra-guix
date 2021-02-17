(define-module (shepherd))


;(load-from-path "./scm/config.scm")
(load "scm/myconfig.scm")

(display "My Shepherd config loading..")
(newline)


(use-modules (shepherd service)
            ; (gnu build shepherd)
             ((ice-9 ftw) #:select (scandir))
;  #:declarative? #f
 )

;    ;(load-from-path "./services/syncthing.scm")
;(load "scm/services/syncthing.scm")
(load "scm/services/mycron.scm")

;; Load all the files in the directory 'init.d' with a suffix '.scm'.
; (for-each
;  (lambda (file)
;    (load (string-append "services/" file)))
;  (scandir (string-append (dirname (current-filename)) "/services")
;           (lambda (file)
;           (string-suffix? ".scm" file))))

;; Send shepherd into the background
(action 'shepherd 'daemonize)
