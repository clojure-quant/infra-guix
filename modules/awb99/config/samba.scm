(define-module (awb99 config samba)
#:use-module (guix) ; local-file plain-file
#:use-module (gnu services)
#:use-module (gnu services samba)
#:export (service-samba))

(define service-samba 
(service samba-service-type (samba-configuration
  (enable-smbd? #t)
  (enable-nmbd? #t)
  (enable-winbindd? #t)
  (config-file (plain-file "smb.conf" "\
[global]
map to guest = Bad User
logging = syslog@1

[public]
browsable = yes
path = /media/nas
read only = yes
guest ok = yes
guest only = yes\n")))))
