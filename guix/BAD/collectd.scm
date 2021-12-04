(define-module (zpid services collectd)
#:use-module (guix records)
#:use-module (guix gexp)
#:use-module (gnu services)
#:use-module (gnu services shepherd)
#:use-module (gnu packages monitoring)
#:use-module (ice-9 match)
#:export (collectd-configuration collectd-service-type))

(define-record-type* <collectd-configuration>
collectd-configuration make-collectd-configuration collectd-configuration?
(package      collectd-configuration-package
              (default collectd))
(file         collectd-configuration-file))

; from: 
; https://github.com/leibniz-psychology/psychnotebook-deploy/blob/master/src/zpid/services/collectd.scm

(define collectd-shepherd-service
(match-lambda
  (($ <collectd-configuration> package file)
   (shepherd-service
    (documentation "Collect system and application performance metrics periodically.")
    (provision '(collectd))
    (requirement '(networking)) ; for host name
    (start #~(make-forkexec-constructor
              (list #$(file-append package "/sbin/collectd")
                    "-C" #$file
                    "-f")
               #:log-file "/var/log/collectd.log"))
    (stop #~(make-kill-destructor))))))

(define collectd-service-type
(service-type
 (name 'collectd)
 (description
  "Run @command{collectd} to collect system and application performance
metrics periodically.")
 (extensions
  (list (service-extension shepherd-root-service-type
                           (compose list collectd-shepherd-service))))))