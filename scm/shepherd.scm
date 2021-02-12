(use-modules (shepherd service)
             ((ice-9 ftw) #:select (scandir))
;  #:declarative? #f
 )

(display "My Shepherd config loading..")
(newline)

;(add-to-load-path (dirname (current-filename)))
;(add-to-load-path "scm")
(add-to-load-path ".")
(display %load-path) 
(newline)


(set! %load-hook (lambda (filename)
                   (format #t "Loading service ~a ...\n" filename)))


;(load-from-path "./services/syncthing.scm")

;(load "services/syncthing.scm")
(load "services/mycron.scm")

;; Load all the files in the directory 'init.d' with a suffix '.scm'.
; (for-each
;  (lambda (file)
;    (load (string-append "services/" file)))
;  (scandir (string-append (dirname (current-filename)) "/services")
;           (lambda (file)
;           (string-suffix? ".scm" file))))

;; Send shepherd into the background
(action 'shepherd 'daemonize)
