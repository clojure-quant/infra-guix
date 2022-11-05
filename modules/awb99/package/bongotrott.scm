(define-module (gorilla packages bongotrott)
#:use-module (guix licenses)
#:use-module (guix gexp)
#:use-module (guix packages)
#:use-module (guix build-system gnu)
#:use-module (guix build-system trivial)
#:use-module (gnu packages bash)
#:export (bongotrott)
)


; http://lists.gnu.org/archive/html/help-guix/2016-08/msg00101.html
; https://github.com/alezost/guix-config/blob/master/misc/shell-script-example/guix.scm


(define bongotrott
(package
(name "bongotrott")
(version "0.4")
(source (local-file (string-append (search-path %load-path "gorilla/packages/myscript2")))) 
(build-system trivial-build-system)
(supported-systems '("x86_64-linux" "i686-linux"))
(arguments
`(#:modules ((guix build utils))
 #:builder
 (begin
   (use-modules (guix build utils))
   (let* ((bin-dir  (string-append %output "/bin"))
          (bin-file (string-append bin-dir "/" ,"myscript2"))
          (bash-bin (string-append (assoc-ref %build-inputs "bash")
                                   "/bin")))
     (mkdir-p bin-dir)
     (copy-file (assoc-ref %build-inputs "source") bin-file)
     (patch-shebang bin-file (list bash-bin))
     (chmod bin-file #o555)))))
(inputs `(("bash" ,bash)))
(synopsis "bla bla")
(description "More verbose bla bla")
(home-page  "https://github.com/babashka/babashka")
(license gpl3+)))