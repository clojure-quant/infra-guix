(define-module (awb99 config users)
  #:use-module (guix) ; local-file
  #:use-module (gnu services)
  #:use-module (gnu services ssh)
  #:use-module (gnu packages ssh) ; openssh-sans-x
  #:use-module (gnu system shadow) ; openssh-sans-x
  #:use-module (gnu packages shells) ; zsh
  #:export (mygroups myusers myusers-vm))


(define mygroups
  (cons* 
    (user-group 
      (system? #f) 
      (name "bongotrotters"))
    %base-groups))


    ;; Adding the account to 
    ;;  "wheel" group; makes it a sudoer.  
    ;; Adding it to "audio" and "video" allows the user to play sound and access the webcam.


(define myusers
  (cons* 
    (user-account
      (name "florian")
      (comment "Florian")
      (group "users")
      (home-directory "/home/florian")
      ;(shell (file-append fish "/bin/fish"))
      ; (identity "/home/florian/repo/myLinux/data/ssh/coin")
      (supplementary-groups
        ;; "input" and "tty" are needed to start X server without
        ;; root permissions: "input" - to access "/dev/input"
        ;; devices, "tty" - to access "/dev/ttyN".

      '("wheel" 
        "netdev" 
        "audio" 
        "video"
        "tty"
      )))
    (user-account
      (name "bob")
      (comment "Alice's bro")
      (group "users")
      (home-directory "/home/robert")
    ;  (shell (file-append zsh "/bin/zsh"))
    )
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

