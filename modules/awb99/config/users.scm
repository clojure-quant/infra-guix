(define-module (awb99 config users)
  #:use-module (guix) ; local-file
  #:use-module (gnu services)
  #:use-module (gnu services ssh)
  #:use-module (gnu packages ssh) ; openssh-sans-x
  #:use-module (gnu system shadow) ; openssh-sans-x
  #:use-module (gnu packages shells) ; zsh
  #:export (mygroups myusers myusers-vm my-sudoers-file))


(define-public mygroups
  (cons* 
    (user-group 
      (system? #f) 
      (name "bongotrotters"))
    %base-groups))



(define-public groups-server
  '("wheel" ;  makes it a sudoer
    "netdev" ;; network devices
    "audio" "video" ; play sound and access the webcam.
    "tty"   ; to access "/dev/ttyN".
    "input" ; to access "/dev/input"
    ;; "input" and "tty" are needed to start X server without root permissions: "input" 
    ; "kvm" "libvirt"  ; run qemu as florian with kvm support.
    ; "lp" "lpadmin"
    ; "wireshark"
  ))

(define-public groups-desktop
   '(; server-groups
     "wheel" 
     "netdev" 
     "audio" 
     "video"
     "tty"
    ; desktop groups
     "lp"  ; line printer
     "lpadmin" ; line printer admin
     "kvm"  ; hardware-acceleration qemu as user with kvm support.
     "docker" ; run docker as non root
    ; "libvirt"
    ; "libvirt-qemu "
    ;;"wireshark"
   ))

(define-public (create-user user-name user-id groups)
  (user-account
    (name user-name)
    (comment user-name)
    (uid user-id) ; uid needs to match user in host for docker; in cli: "id"
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
   ; (identity "../../../keys/viktor")
    ;  (shell (file-append zsh "/bin/zsh"))
  ))

(define-public user-florian
  (user-account
    (name "florian")
    (comment "Florian")
    (group "users")
    (home-directory "/home/florian")
    ;(shell (file-append fish "/bin/fish"))
   ; (identity "../../../keys/flo5")
    (supplementary-groups
      '("wheel" 
        "netdev" 
        "audio" "video"
        "tty"
        ; "input"
        ; "kvm" "libvirt"  ; run qemu as florian with kvm support.
        ; "lp" "lpadmin"
       ; "wireshark"
    ))))


(define myusers
  (cons* 
     user-florian
     user-viktor
     %base-user-accounts))
  

(define myusers-vm
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


 ;; Our /etc/sudoers file.  Since 'guest' initially has an empty password,
  ;; allow for password-less sudo.
(define my-sudoers-file 
   (plain-file "sudoers" "\
    root ALL=(ALL) ALL
    %wheel ALL=NOPASSWD: ALL\n"))

