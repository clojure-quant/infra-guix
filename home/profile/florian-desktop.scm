(use-modules
  (guix) 
  (gnu) 
  (gnu packages)
  (gnu packages shells)
  (gnu packages guile-xyz)
  (gnu services)
  (guix gexp)
  (gnu home)
  (gnu home services)
  (gnu home services shells)
  (gnu home services mcron)
  (mcron job-specifier)   ; For user/system files.
  (mcron base)
 ;(mcron scripts mcron)
 ;(mcron config)
 ;(mcron utils)
 ;(mcron vixie-specification)
 ;(mcron core)
;  (yellowsquid services pipewire)
  (awb99 guixutils) 
  (awb99 helper)
  (awb99 vault)
  (awb99 packages wm)
  (awb99 packages fonts)
  ;((awb99 home emacs) #:prefix emacs:)
  ;(awb99 home sway)
;  (awb99 home emacs)
  ;(awb99 home alacritty)
  
  )

; mcron home example:
; https://hg.sr.ht/~yoctocell/guixrc/browse/yoctocell/home/mcron.scm?rev=tip
; https://git.sr.ht/~efraim/guix-config/tree/master/item/efraim-home.scm



(define bash-service
  (service home-bash-service-type
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
        (list (local-file "../config/bash/.bashrc" "bashrc")))
      (bash-profile
        (list (local-file "../config/bash/.bash_profile" "bash_profile"))))))

(define zsh-service
  (service home-zsh-service-type
        (home-zsh-configuration
          (zshrc 
            (list (local-file "../config/zsh/.zshrc" "zshrc"))) ; relativ to profile dir
          (zprofile 
            (list (local-file "../config/zsh/.zprofile" "zprofile")))
          ; zlogin
          
          )))

; guix install glibc-locales
; export GUIX_LOCPATH=$HOME/.guix-profile/lib/locale


(define dummy-job-1
   #~(job '(next-minute (range 0 60 10))
   (lambda ()
     (system* "date" ))))

(define dummy-job-2
  #~(job next-minute-from
      (lambda ()
        (call-with-output-file (string-append (getenv "HOME") "/mcron-file")
          (lambda (port)
            (display "Mcron service" port))))))

(define hello-job-1
  (job
    '(next-hour '(0 15 30 45))
     "echo `date` >> /tmp/d.txt"))

(define hello-job-2
  #~(job '(next-minute '(1))
       (lambda ()
          (execl "echo"
                "hello > /tmp/hello.txt"))))



(define user-garbage-job
  ;; Collect garbage 5 minutes after 0am every day.
  ;; The job's action is a shell command.
  #~(job "35 0 * * *"            ;Vixie cron syntax
         "guix pull && guix package --upgrade"
         #:user "florian"
       ))


(define mcron-service
  ;; Example configuration, the first job runs mbsync once every ten
  ;; minutes, the second one writes "Mcron service" to ~/mcron-file once
  ;; every minute.
  (service home-mcron-service-type
    (home-mcron-configuration
      (jobs 
        (list 
         ;  dummy-job-1
          dummy-job-2
         ; hello-job-1  ; does not work.
         ; hello-job-2
         ; user-garbage-job
                )))))


(define my-config-service
  (simple-service 'test-config
    home-files-service-type
      (list `(".config/test.conf" ,(plain-file "tmp-file.txt" "2022 10 the content of ~/.config/test.conf"))
           ; ssh client config 
             `(".ssh/config" ,(local-file "../config/ssh/config"))
           ; git config 
            `(".gitconfig" ,(local-file "../config/git/gitconfig"))
           ; alacritty terminal config
            `(".config/alacritty/alacritty.yml" ,(local-file "../config/alacritty/alacritty.yml"))
   	    ; emacs
          ;  `(".emacs.d/init.el" ,(local-file "../config/emacs/init.el"))
	  ;  `("emacsload/cfrs.el" ,(local-file "../config/emacs/cfrs.el"))
	    
           ; sway / waybar
            `(".config/sway/config" ,(local-file "../config/sway/config"))
            `(".config/waybar/config" ,(local-file "../config/waybar/config"))
            `(".config/waybar/style.css" ,(local-file "../config/waybar/style.css"))
           ; clojure
            `(".config/clojure/deps.edn" ,(local-file "../config/clojure/deps.edn"))
            `(".config/clojure/cljfmt.edn" ,(local-file "../config/clojure/cljfmt.edn"))
            ; rclone
            `(".config/rclone/rclone.conf" ,(local-file (rclone-config-filename "florian")))
            ;`("xsettingsd" ,(local-file "./config/xsettingsd/xsettingsd.conf"))
       )))


(define env-vars-service
  (simple-service  'some-useful-env-vars-service
    home-environment-variables-service-type
      `(;("LESSHISTFILE" . "$XDG_CACHE_HOME/.lesshst")
        ;("SHELL" . ,(file-append zsh "/bin/zsh"))
        ("USELESS_VAR" . #f)
       ; ("_JAVA_AWT_WM_NONREPARENTING" . #t)
        ("GDK_SCALE" . "1")
        ("MOZ_ENABLE_WAYLAND" . "1") ; for icecat
        ("MYVAULT" . "/home/florian/repo/myLinux/myvault")
	("SPACEMACSDIR" . "/home/florian/.config/spacemacs")
      )))


(define (specifications->package specs)
  (map specification->package specs))

(home-environment
  (packages
    ;(list )
    (append
     (->packages-output
      (list
     ;  "emacs"
     ;  "emacs-which-key"
     ;  "emacs-rainbow-delimiters"
     ;  "emacs-posframe" ; required by treemacs which requires cfrs
     ;  "emacs-treemacs"
     ;  "emacs-projectile"
     ;  "emacs-magit"
     ;  "emacs-vterm"
       ; clojure
     ;  "emacs-clojure-mode"
     ;  "emacs-cider"
     ;  "emacs-anakondo"
     ;  "emacs-helm-cider"
       ; markdown
     ;  "emacs-markdown-mode"
     ;  "emacs-markdown-preview-mode"
       ))
     (list )
     ; (->packages-output user-packages)
      ;(->packages-output packages-wm-sway)
      ;(->packages-output packages-wm-extra) ; for enlightenment
     ;(->packages-output font-packages) 
     ;;  emacs-packages
      ))
    
  (services
    ;(append 
      (list
        env-vars-service
        my-config-service
        bash-service
        zsh-service
        mcron-service
       ; (service home-pipewire-service-type)
       ; (service home-wireplumber-service-type)
      
     ; )
      ;sway-services
;      emacs-services
      ;alacritty-services
    )

    ))
