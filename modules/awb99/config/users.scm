(define-module (awb99 config users)
  #:use-module (guix) ; local-file
  #:use-module (gnu services)
  #:use-module (gnu services ssh)
  #:use-module (gnu packages ssh) ; openssh-sans-x
  #:use-module (gnu system shadow) ; openssh-sans-x
  #:use-module (gnu packages shells) ; zsh
  #:export (mygroups myusers myusers-vm))


(define-public mygroups
  (cons* 
    (user-group 
      (system? #f) 
      (name "bongotrotters"))
    %base-groups))


;; Adding the account to group
;; "input" and "tty" are needed to start X server without
;; root permissions: "input" - to access "/dev/input"
;; devices, "tty" - to access "/dev/ttyN".
;; "wheel"                makes it a sudoer
;; "audio" and "video"    play sound and access the webcam.

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

