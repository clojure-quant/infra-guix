(define-module (awb99 services file-sync)
  #:use-module (gnu)
  #:use-module (gnu services syncthing)
  #:export (service-syncthing))



;The (gnu services syncthing) module provides the following services:
; You might want a syncthing daemon if you have files between two or more computers and want to sync them in real time, safely protected from prying eyes.

; http://localhost:8384/
; Two devices will only connect and talk to each other if they are both configured with each other’s device ID. 
; A device ID is a unique, cryptographically-secure identifier that is generated as part of the key generation the 
; first time you start Syncthing. 
; It is printed in the log above, and you can see it in the web GUI by selecting “Actions” (top right) and “Show ID

; ssh -L 9090:127.0.0.1:8384 user@othercomputer.example.com

; ssh -N -L 9090:127.0.0.1:8384 user@othercomputer.example.com

; Print device ID to command line
; syncthing --device-id



(define service-syncthing
  (service syncthing-service-type
    (syncthing-configuration 
      (user "florian") ; The user as which the Syncthing service is to be run. This assumes that the specified user exists.
      ; group (default: "users")
      ; home (default: #f) Common configuration and data directory. The default configuration directory is $HOME of the specified Syncthing user.
      ; logflags (default: 0) Sum of logging flags, see Syncthing documentation logflags.
      ; arguments (default: ’())  ; List of command-line arguments passing to syncthing binary.
      )))

    



; (service rsync-service-type)
; package (default: rsync) rsync package to use.
; port-number (default: 873) TCP port on which rsync listens for incoming connections. If port is less than 1024 rsync needs to be started as the root user and group.
; pid-file (default: "/var/run/rsyncd/rsyncd.pid") Name of the file where rsync writes its PID.
; lock-file (default: "/var/run/rsyncd/rsyncd.lock") Name of the file where rsync writes its lock file.
; log-file (default: "/var/log/rsyncd.log") Name of the file where rsync writes its log file.
; use-chroot? (default: #t) Whether to use chroot for rsync shared directory.
; share-path (default: /srv/rsync) Location of the rsync shared directory.
; share-comment (default: "Rsync share") Comment of the rsync shared directory.
; read-only? (default: #f) Read-write permissions to shared directory.
; timeout (default: 300) I/O timeout in seconds.
; user (default: "root") Owner of the rsync process.
; group (default: "root") Group of the rsync process.
; uid (default: "rsyncd") User name or user ID that file transfers to and from that module should take place as when the daemon was run as root.
; gid (default: "rsyncd") Group name or group ID that will be used when accessing the module.
