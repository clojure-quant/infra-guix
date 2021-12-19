;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules
  (gnu home)
  (gnu packages)
  (gnu services)
  (guix gexp)
  (gnu home services shells)
  (gnu home services mcron)
  (awb99 guixutils) 
  (awb99 config helper)
  (awb99 packages) 
  )

(define nuc-packages
  (append 
    ; clojure apps
      clojure-packages
      node-packages
    ; python-packages
    ; r-packages
      build-packages
    ; linux cli
      security-packages
      archive-packages
      monitor-packages
      network-packages
      file-transfer-packages
      shell-packages
      hardware-packages
    ; apps
      guix-core-packages
      virtual-machine-packages
      crypto-packages
    ; desktop
      desktop-chat-packages
      desktop-multimedia-packages
      desktop-office-packages
      desktop-browser-packages 
      desktop-tool-packages
    ; services
      services-packages
    ))


(define (specifications->package specs)
  (map specification->package specs))

(define bash-service
  (service
    home-bash-service-type
    (home-bash-configuration
      (aliases
        '(("grep='grep --color" . "auto")
          ("ll" . "ls -l")
          ("psg" . "ps aux | grep -i")
          ("ls='ls -p --color" . "auto")
          ("tml" . "tmux list-sessions")
          ("tma" . "TERM=xterm-24bits tmux attach-session -t")

        ))
      (bashrc
        (list (local-file "./bash/.bashrc" "bashrc")))
      (bash-profile
        (list (local-file "./bash/.bash_profile" "bash_profile"))))))

(define mcron-service
  ;; Example configuration, the first job runs mbsync once every ten
  ;; minutes, the second one writes "Mcron service" to ~/mcron-file once
  ;; every minute.
  (service home-mcron-service-type
    (home-mcron-configuration
      (jobs 
        (list 
          #~(job '(next-minute (range 0 60 10))
            (lambda ()
              (system* "date" )))
                  
          #~(job next-minute-from
            (lambda ()
              (call-with-output-file (string-append (getenv "HOME") "/mcron-file")
                (lambda (port)
                  (display "Mcron service" port))))))))))


(define test-config-service
  (simple-service 'test-config
    home-files-service-type
      (list `("config/test.conf"
             ,(plain-file "tmp-file.txt"
                          "the content of ~/.config/test.conf")))))

(define env-vars-service
  (simple-service 
    'some-useful-env-vars-service
    home-environment-variables-service-type
      `(("LESSHISTFILE" . "$XDG_CACHE_HOME/.lesshst")
        ("SHELL" . ,(file-append zsh "/bin/zsh"))
        ("USELESS_VAR" . #f)
        ("_JAVA_AWT_WM_NONREPARENTING" . #t))))


(home-environment
  (packages
    (->packages-output ; ->packages ; map specification->package
        nuc-packages))
  (services
    (list
       bash-service
       mcron-service
       test-config-service
       ;env-vars-service

    )))
