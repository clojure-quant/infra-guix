(define-module (awb99 services trateg)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-1)
  #:use-module (nongnu packages clojure)
  #:export (trateg-service-configuration
            trateg-service-type))


; see: https://github.com/guix-mirror/guix/blob/892f1b7273d57b25940700877a02618fe826cc08/gnu/services/syncthing.scm


(define-record-type* <trateg-service-configuration>
  trateg-service-configuration make-trateg-service-configuration
  trateg-service-configuration?

  (param1 trateg-service-configuration-param1
          (default "foo")

  (arguments trateg-configuration-arguments ;list of strings
        (default '()))
        
        ))

(define trateg-shepherd-service
  (match-lambda
    (($ <trateg-service-configuration> param1)
      (list 
        (shepherd-service
          (provision '(trateg))
          (documentation "trateg goldly docs")
          (requirement '(loopback))  ; services need to be started before current service
          (start 
            #~(make-forkexec-constructor
                (append (list (string-append #$clojure-tools "/bin/clj")
                              "-X:goldly-docs")
                         '#$arguments))
            #:directory "/home/shared/repo/clojure-quant/trateg/app/demo"
            #:user "florian"
            #:group "users"
            #:environment-variables (list "EDIRECT_PUBMED_MASTER=/export2/PubMed"
                                          "NLTK_DATA=/home/hchen/nltk_data")
            #:log-file (string-append %logdir "/goldly.log")
            ;#:pid-file #f
            ;#:pid-file-timeout (default-pid-file-timeout)
            ;#:file-creation-mask #f
            #:respawn? #f
            ) 
          (stop #~(make-kill-destructor))
    )))))
         

(define trateg-service-type
  (service-type
    (name 'trateg)
    (extensions (list (service-extension 
                       shepherd-root-service-type
                       trateg-shepherd-service)))
    (default-value (trateg-service-configuration))))

