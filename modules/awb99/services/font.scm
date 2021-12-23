

(service console-font-service-type
(map (lambda (tty)
       (cons tty %default-console-font))
     '("tty1" "tty2" "tty3" "tty4" "tty5" "tty6")))
