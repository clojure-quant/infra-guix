
(define-module (awb99 services mail)
#:use-module (gnu services)
#:use-module (gnu services base)
#:use-module (gnu services configuration)
#:use-module (gnu services shepherd)
#:use-module (gnu system pam)
#:use-module (gnu system shadow)
#:use-module (gnu packages admin)
#:use-module (gnu packages mail)
#:use-module (guix gexp)
#:use-module (guix records)
#:use-module (ice-9 match)
#:export (dkimproxy-out-service-type

          dkimproxy-out-signature-configuration
          dkimproxy-out-signature-configuration-type
          dkimproxy-out-signature-configuration-key
          dkimproxy-out-signature-configuration-algorithm
          dkimproxy-out-signature-configuration-method
          dkimproxy-out-signature-configuration-domain
          dkimproxy-out-signature-configuration-identity
          dkimproxy-out-signature-configuration-selector

          dkimproxy-out-configuration
          dkimproxy-out-configuration-package
          dkimproxy-out-configuration-listen
          dkimproxy-out-configuration-relay
          dkimproxy-out-configuration-list-id-map
          dkimproxy-out-configuration-sender-map
          dkimproxy-out-configuration-reject-error?

          dkimproxy-out-configuration-config-file))


;        https://notabug.org/jbranso/linode-guix-system-configuration/src/master/opensmtpd.scm


(define-record-type* <dkimproxy-out-signature-configuration>
dkimproxy-out-signature-configuration make-dkimproxy-out-signature-configuration
dkimproxy-out-signature-configuration?
(type      dkimproxy-out-signature-configuration-type
           (default 'dkim))
(key       dkimproxy-out-signature-configuration-key
           (default #f))
(algorithm dkimproxy-out-signature-configuration-algorithm
           (default #f))
(method    dkimproxy-out-signature-configuration-method
           (default #f))
(domain    dkimproxy-out-signature-configuration-domain
           (default #f))
(identity  dkimproxy-out-signature-configuration-identity
           (default #f))
(selector  dkimproxy-out-signature-configuration-selector
           (default #f)))

(define generate-dkimproxy-out-signature-configuration
(match-lambda
  (($ <dkimproxy-out-signature-configuration>
      type key algorithm method domain identity selector)
   (string-append
     (match type
       ('dkim "dkim")
       ('domainkeys "domainkeys"))
     (if (or key algorithm method domain identity selector)
         (string-append
           "("
           (string-join
            `(
              ,@(if key
                  (list (string-append "key=" key))
                  '())
             ,@(if algorithm
                 (list (string-append "a=" algorithm))
                 '())
             ,@(if method
                 (list (string-append "c=" method))
                 '())
             ,@(if domain
                 (list (string-append "d=" domain))
                 '())
             ,@(if identity
                 (list (string-append "i=" identity))
                 '())
             ,@(if selector
                 (list (string-append "s=" selector))
                 '()))
            ",")
           ")")
         "")))))

(define-record-type* <dkimproxy-out-configuration>
dkimproxy-out-configuration make-dkimproxy-out-configuration
dkimproxy-out-configuration?
(package     dkimproxy-out-configuration-package
             (default dkimproxy))
(listen      dkimproxy-out-configuration-listen
             (default #f))
(relay       dkimproxy-out-configuration-relay
             (default #f))
(list-id-map dkimproxy-out-configuration-list-id-map
             (default '()))
(sender-map  dkimproxy-out-configuration-sender-map
             (default '()))
(reject-error? dkimproxy-out-configuration-sender-reject-error?
               (default #f))
(config-file dkimproxy-out-configuration-config-file
             (default #f)))

(define (generate-map-file config filename)
(apply plain-file filename
       (map (lambda (config)
              (match config
                ((selector (config ...))
                 (string-append
                   selector " "
                   (string-join
                     (map generate-dkimproxy-out-signature-configuration config)
                     "\n")))
                ((selector config)
                 (string-append
                   selector " "
                   (generate-dkimproxy-out-signature-configuration config)))))
            config)))

(define dkimproxy-out-shepherd-service
(match-lambda
  (($ <dkimproxy-out-configuration> package listen relay list-id-map sender-map
      reject-error? config-file)
   (list (shepherd-service
           (provision '(dkimproxy-out))
           (requirement '(loopback))
           (documentation "Outbound DKIM proxy.")
           (start (let ((proxy (file-append package "/bin/dkimproxy.out")))
                    (if config-file
                      #~(make-forkexec-constructor
                          (list #$proxy (string-append "--conf_file=" #$config-file)
                                "--pidfile=/var/run/dkimproxy.out.pid"
                                "--user=dkimproxy" "--group=dkimproxy")
                          #:pid-file "/var/run/dkimproxy.out.pid")
                      (let* ((first-signature (match sender-map
                                               (((sender (signature _ ...)) _ ...)
                                                 signature)
                                               (((sender signature) _ ...)
                                                 signature)))
                             (domains
                               (apply append
                                 (map
                                   (lambda (sender)
                                     (match sender
                                       (((domains ...) config)
                                        domains)
                                       ((domain config)
                                        domain)))
                                   sender-map)))
                             (sender-map (generate-map-file sender-map
                                                            "sender.map"))
                             (listid-map
                               (if (null? list-id-map)
                                   #f
                                   (generate-map-file list-id-map "listid.map")))
                             (keyfile
                               (dkimproxy-out-signature-configuration-key
                                 first-signature))
                             (selector
                               (dkimproxy-out-signature-configuration-selector
                                 first-signature))
                             (method
                               (dkimproxy-out-signature-configuration-method
                                 first-signature))
                             (signature
                               (match (dkimproxy-out-signature-configuration-type
                                        first-signature)
                 ('dkim "dkim")
                 ('domainkeys "domainkeys"))))
                        #~(make-forkexec-constructor
                            `(,#$proxy "--pidfile=/var/run/dkimproxy.out.pid"
                              "--user=dkimproxy" "--group=dkimproxy"
                              ,(string-append "--listen=" #$listen)
                              ,(string-append "--relay=" #$relay)
                              ,(string-append "--sender_map=" #$sender-map)
                              ,@(if #$listid-map
                                  (list
                                    (string-append "--listid_map=" #$listid-map))
                                  '())
                              ,(string-append "--domain=" #$domains)
                              ,(string-append "--keyfile=" #$keyfile)
                              ,(string-append "--selector=" #$selector)
                              ,@(if #$method
                                    (list
                                      (string-append "--method=" #$method))
                                    '())
                              ,@(if #$reject-error?
                                    '("--reject_error")
                                    '())
                              ,@(if #$signature
                                    (list
                                      (string-append "--signature=" #$signature))
                                    '())))))))
           (stop #~(make-kill-destructor)))))))

(define %dkimproxy-accounts
(list (user-group
        (name "dkimproxy")
        (system? #t))
      (user-account
        (name "dkimproxy")
        (group "dkimproxy")
        (system? #t)
        (comment "Dkimproxy user")
        (home-directory "/var/empty")
        (shell (file-append shadow "/sbin/nologin")))))

(define dkimproxy-out-service-type
(service-type
  (name 'dkimproxy-out)
  (extensions
    (list (service-extension account-service-type
                             (const %dkimproxy-accounts))
          (service-extension shepherd-root-service-type
                             dkimproxy-out-shepherd-service)))))
