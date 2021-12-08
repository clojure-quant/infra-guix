Remove all avahi
(remove (lambda (service)
          (eq? (service-kind service) avahi-service-type))
        %desktop-services)


       
(use-modules (gnu home)
             (gnu home services)
             (gnu home services shells)
             (gnu services)
             (gnu packages admin)
             (guix gexp))


(home-environment
 (packages (list htop))
 (services
  (list
   (service home-bash-service-type
            (home-bash-configuration
             (guix-defaults? #t)
             (bash-profile '("\
export HISTFILE=$XDG_CACHE_HOME/.bash_history"))))

   (simple-service 'test-config
                   home-files-service-type
                   (list `("config/test.conf"
                           ,(plain-file "tmp-file.txt"
                                        "the content of ~/.config/test.conf")))))))





(simple-service 'some-useful-env-vars-service
		home-environment-variables-service-type
		`(("LESSHISTFILE" . "$XDG_CACHE_HOME/.lesshst")
                  ("SHELL" . ,(file-append zsh "/bin/zsh"))
                  ("USELESS_VAR" . #f)
                  ("_JAVA_AWT_WM_NONREPARENTING" . #t)))
