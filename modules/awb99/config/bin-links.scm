(define-module (awb99 config bin-links)
#:use-module (gnu)
#:use-module (gnu packages bash) 
#:use-module (gnu packages shells) ; fish + zsh
#:export (service-bin-links))

(define service-bin-links
  (service special-files-service-type
     `(("/usr/bin/env" ,(file-append coreutils "/bin/env"))
       ("/bin/bash" ,(file-append bash "/bin/sh"))
       ("/bin/sh" ,(file-append bash "/bin/sh"))
       ;("/bin/fish" ,(file-append fish "/bin/fish"))
       ("/bin/zsh" ,(file-append zsh "/bin/zsh"))
       )))

  
