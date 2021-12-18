(define-module (awb99 service trateg)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (ice-9 match)
  #:export (trateg-service-configuration
            myservice-service-type))


(define-record-type* <trateg-service-configuration>
  trateg-service-configuration make-trateg-service-configuration
  trateg-service-configuration?
  (param1 trateg-service-configuration-param1
          (default "foo")))

(define trateg-shepherd-service
(match-lambda
  (($ <trateg-service-configuration> param1)
    (list (shepherd-service
            (provision '(trateg))
            (documentation "trateg service")
            (requirement '())  ; services need to be started before current service
            (start #~(make-forkexec-constructor
                      (list (string-append #$service-package "/bin/exe-name")
                            "-foo" "-bar" ; list of command line arguments
                        )))
            (stop #~(make-kill-destructor)))))))

(define trateg-service-type
  (service-type
    (name 'trateg)
    (extensions (list (service-extension 
                       shepherd-root-service-type
                       trateg-shepherd-service)))
    (default-value (trateg-service-configuration))))