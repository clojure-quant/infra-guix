(define-module (awb99 vault))


(define-public (ssh-key-filename key-name)
(string-append 
   (getenv "MYVAULT") 
   "/ssh/" 
   key-name 
    ".pub"))


(define-public (rclone-config-filename user-name)
(string-append 
  (getenv "MYVAULT") 
  "/rclone/" 
   user-name
  "-rclone.conf"))


;(display "flo2022 pub file: ")
;(display (ssh-key-filename "flo2022"))

(define-public (ddclient-config-filename machine-name)
(string-append 
   (getenv "MYVAULT") 
   "/ddclient/" 
    machine-name
    "-ddclient.conf"))

; (display "ddclient file: ")
; (display (ddclient-config-filename "nuc"))