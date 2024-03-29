(define-module (awb99 config bootstrap-files)
  #:use-module (oop goops)  ; Defining classes and methods.
  #:use-module (gnu) 
  ; #:use-module (guix gexp)
  #:export (service-bootstrap-files)
  )



(define service-bootstrap-files
  ;; this creates /etc/os-release file
  ;; relative paths are relativ to this path
  (simple-service 
    'bootstrap-files 
    etc-service-type
    `( 
       ("manifest-bootstrap.scm" ,(local-file "../../../bootstrap/manifest-bootstrap.scm"))
       ("bootstrap.sh" ,(local-file "../../../bootstrap/bootstrap.sh"))
       ("resize-disk.sh" ,(local-file "../../../bootstrap/file-resize-disk.sh"))
      ; ("rock1.scm" ,(local-file "../../../machine/rock.scm"))
       ("flo5.pub" ,(local-file "../../../bootstrap/flo5.pub"))
      ; (local-file "ssh/guixrig_host_rsa_key" #:recursive? #t)
       ("trateg-resize.sh" ,(local-file "../../../bootstrap/trateg-resize.sh"))
       ("trateg-repo.sh" ,(local-file "../../../bootstrap/trateg-repo.sh"))
       ("trateg-data.sh" ,(local-file "../../../bootstrap/trateg-data.sh"))

      
))) 



