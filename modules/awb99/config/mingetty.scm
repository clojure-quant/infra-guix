(define-module (awb99 config mingetty)
  #:use-module (gnu)
  #:use-module (gnu packages bash) 
  #:use-module (gnu packages shells) ; fish + zsh
  #:export (patch-mingetty service-login-prompt))



(define (auto-login-to-tty config tty user)
(if (string=? tty (mingetty-configuration-tty config))
      (mingetty-configuration
       (inherit config)
       (auto-login user))
      config))



(define (patch-mingetty guix-services)
  ; do not login to tty1 - this is where all the os messages are printed to.
  (modify-services guix-services
    (mingetty-service-type config =>
       ;(auto-login-to-tty config "tty3" "florian")
       (mingetty-configuration
         (inherit config)
         (auto-login "florian")
         ;(tty "tty12")
        )

    )))  

;(define service-login-prompt
;  (service login-service-type
;    (login-configuration
;      (motd (plain-file "motd" "Welcome to clojure-quant!  I mean GuixOS!\n\n")))))


           ;   (service agetty-service-type
     ;     (agetty-configuration
     ;       (extra-options '("-L")) ; no carrier detect
     ;       (baud-rate "115200")
     ;       (term "vt100")
     ;       (tty "ttyS0")))