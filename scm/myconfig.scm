(define-module (myconfig))

(display "My env loading..")
(newline)

;;(add-to-load-path (dirname (current-filename)))
;;(add-to-load-path "scm")
(add-to-load-path ".")
(display %load-path)
(newline)

(set! %load-hook (lambda (filename)
                   (format #t "awb99-hook: Loading service ~a ...\n" filename)))

