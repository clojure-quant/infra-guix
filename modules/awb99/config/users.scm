(define-module (awb99 config users)
  #:use-module (guix) ; local-file
  #:use-module (gnu services)
  #:use-module (gnu services ssh)
  #:use-module (gnu packages ssh) ; openssh-sans-x
  #:use-module (gnu system shadow) ; openssh-sans-x
  #:use-module (gnu packages shells) ; zsh
  #:export (groups-desktop
            users-desktop
            users-cli
            sudoers-file-no-password))

;; GROUPS

(define groups-desktop
(cons* 
  (user-group 
    (system? #t) 
    (name "nas")) 
  %base-groups))

;; USER GROUP MEMBERSHIPS

(define user-groups-server
  '("wheel" ;  makes it a sudoer
     "netdev" ;; network/wifi admin 
     "audio" "video" ; play sound and access the webcam.
    
     ;; "input" and "tty" are needed to start X server without root permissions: "input" 
     "tty"   ; to access "/dev/ttyN".
     "input" ; to access "/dev/input"

     "lp"  ; line printer control bluetooth devices
     "lpadmin" ; line printer admin
     ; "realtime"  ;; Enable realtime scheduling
   ))

(define user-groups-vm
  '("kvm"  ; hardware-acceleration qemu as user with kvm support.
    "docker" ; run docker as non root
    ; "libvirt" ;Virt-manager  Needs group: libvirt or libvirtd
    ; "libvirt-qemu "
  ))


(define user-groups-desktop
  (append
    user-groups-server
    user-groups-vm
    '( "nas"
      ;;"wireshark"
      )))

;; USERS

(define-public (create-user user-name user-id groups)
  (user-account
    (name user-name)
    (comment user-name)
    ;(uid user-id) ; uid needs to match user in host for docker; in cli: "id"
    (group "users")
    ;(home-directory "/home/florian")
    ;(shell (file-append fish "/bin/fish"))
    ;; (password (crypt "InitialPassword!" "$6$abc")) ; Specify a SHA-512-hashed initial password.
    ;; (password "")
    (supplementary-groups groups)))



(define-public user-viktor
  (user-account
    (name "viktor")
    (comment "Viktor")
    (group "users")
    (home-directory "/home/viktor")
    ;  (shell (file-append zsh "/bin/zsh"))
  ))

(define-public user-florian
  (user-account
    (name "florian")
    (comment "Florian")
    (group "users")
    (home-directory "/home/florian")
    ;(shell (file-append fish "/bin/fish"))
    (shell (file-append zsh "/bin/zsh"))
    (supplementary-groups user-groups-desktop)))


(define users-desktop
  (cons* 
     user-florian
     ;user-viktor
     %base-user-accounts))
  

(define users-cli
  (cons 
    (user-account
       (name "florian")
       (comment "GNU Guix Live")
       (password "")                     ;no password
       (group "users")
       (supplementary-groups '("wheel"
                               "netdev"
                               "audio"
                               "video"
                               "tty"
                              )))
 %base-user-accounts))

(define-public users-docker
(cons 
  (user-account
     (name "florian")
     (password "")   
     (comment "GNU Guix Live")
     (group "users")
     (supplementary-groups '("wheel"
                             "netdev"
                             "audio"
                             "video"
                             "tty"
                            )))
%base-user-accounts))

 ;; Our /etc/sudoers file.  Since 'guest' initially has an empty password,
  ;; allow for password-less sudo.
(define sudoers-file-no-password
   (plain-file "sudoers" "\
    root ALL=(ALL) ALL
    %wheel ALL=NOPASSWD: ALL\n"))

