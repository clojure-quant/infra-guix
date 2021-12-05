(define-module (awb99 services trezord)
#:use-module (gnu services)
#:use-module (gnu services base)
#:use-module (gnu services configuration)
#:use-module (gnu services shepherd)
#:use-module (gnu system pam)
#:use-module (gnu system shadow)
#:use-module (gnu packages mail)
#:use-module (gnu packages admin)
#:use-module (gnu packages dav)
#:use-module (gnu packages tls)
#:use-module (guix records)
#:use-module (guix packages)
#:use-module (guix gexp)
#:use-module (ice-9 match)
#:use-module (ice-9 format)
#:use-module (srfi srfi-1)
#:use-module (gnu packages finance)  ; trezord package

#:export (trezord-configuration
          trezord-configuration?
          trezord-service-type
          %default-trezord-config-file))

; adapted from:
; https://notabug.org/jbranso/linode-guix-system-configuration/src/master/endlessh-service.scm


; ** USER/GROUP CONFIG ********************************************************

; to see account creation
; cat /etc/group               ; contains plugd group
; cat /etc/passwd              ; contains trezord user

(define %trezord-accounts
(list (user-group
       (name "plugdev")
       (system? #t))
      (user-account
       (name "trezord")
       (group "plugdev")
       (system? #t)
       (comment "Trezor Daemon")
       (home-directory "/var/empty")
       (shell (file-append shadow "/sbin/nologin")))))


; ** CONFIGURATION

(define-record-type* <trezord-configuration>
trezord-configuration make-trezord-configuration
trezord-configuration?
(package     trezord-configuration-package
             (default trezord))
(config-file trezord-configuration-config-file
             (default %default-trezord-config-file)))

(define %default-trezord-config-file
(plain-file "trezord.conf" "
[auth]
type = htpasswd
htpasswd_filename = /var/lib/trezord/users
htpasswd_encryption = plain
[server]
hosts = localhost:5232"))




; provision: name of herd service
; requirement: service that it depends on

(define trezord-shepherd-service
(match-lambda
  (($ <trezord-configuration> package config-file)
   (list (shepherd-service
          (provision '(trezor))
          (documentation "Run the trezord daemon.")
          (requirement '(networking))
          (start #~(make-forkexec-constructor
                    (list #$(file-append package "/bin/trezord-go")
                      ; "-u=false" "-e" "21326"

                      ; "-C" #$config-file
                      )

                    #:user "trezord"
                    #:group "plugdev"))
          (stop #~(make-kill-destructor)))))))

(define trezord-activation
(match-lambda
  (($ <trezord-configuration> package config-file)
   (with-imported-modules '((guix build utils))
     #~(begin
         (use-modules (guix build utils))
         (let ((uid (passwd:uid (getpw "trezord")))
               (gid (group:gid (getgr "plugdev"))))
           (mkdir-p "/var/lib/trezord/collections")
           (chown "/var/lib/trezord" uid gid)
           (chown "/var/lib/trezord/collections" uid gid)
           (chmod "/var/lib/trezord" #o700)))))))

(define trezord-service-type
(service-type
 (name 'trezord)
 (description "Run trezord.")
 (extensions
  (list  (service-extension shepherd-root-service-type trezord-shepherd-service)
        (service-extension account-service-type (const %trezord-accounts))
         (service-extension activation-service-type trezord-activation)
        ))
 (default-value (trezord-configuration))))

