# Guile

 https://guix.gnu.org/cookbook/en/guix-cookbook.html#Scheme-tutorials

 #f (or #false) and #t (or #true) are the booleans

(+ (pk 2) 3) prints 2, and returns 5
module = namespace

(define-module (boxes)
  #:export (make-box box-ref box-set! box-swap!))

(define (make-box x) (list x))
(define (box-ref box) (car box))
(define (box-set! box x) (set-car! box x))
(define (box-swap! box x)
  (let ((y (box-ref bo)))
    (box-set! box x)
    y))

https://www.gnu.org/software/guile/manual/html_node/Module-System-Reflection.html#Module-System-Reflection

# Repl

guix repl
,use (guix profiles)
(map manifest-entry-name (manifest-entries (profile-manifest "/home/<username>/.guix-profile")))

That is nice, because then you can just edit that file to change your package set. Also, you can backup that file, copy it to another computer, or put it under version control.



