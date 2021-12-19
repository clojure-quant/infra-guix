(define-module (awb99 services os-release)
  #:use-module (oop goops)  ; Defining classes and methods.
  #:use-module (gnu) 
  ; #:use-module (guix gexp)
  #:export (service-os-release)
  )


(define os-release-file
  (plain-file 
    "os-release"
    (string-append
     "NAME=\"Guix System\"\n"
     "PRETTY_NAME=\"Guix System\"\n"
     "VERSION=\""((@ (guix packages) package-version) (@ (gnu packages package-management) guix))"\"\n"
     "VERSION_ID=\"" ((@ (guix utils) version-major+minor+point)
                      ((@ (guix packages) package-version)
                      (@ (gnu packages package-management) guix))) "\"\n"
     "ID=guix\n"
     "HOME_URL=\"https://www.gnu.org/software/guix/\"\n"
     "SUPPORT_URL=\"https://www.gnu.org/software/guix/help/\"\n"
     "BUG_REPORT_URL=\"mailto:bug-guix@gnu.org\"\n")))




(define service-os-release
  ;; this creates /etc/os-release file
  (simple-service 
    'os-release 
    etc-service-type
    `(("os-release" ,os-release-file))))



