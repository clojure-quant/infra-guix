(define-module (awb99 config file-nfs)
  #:use-module (gnu)
  #:use-module (gnu services nfs)
  #:export (service-nfs))




(define service-nfs
  (service nfs-service-type
    (nfs-configuration 
      (exports
       '(("/media/nas"
          "*(ro,insecure,no_subtree_check,crossmnt,fsid=0)"))))))







