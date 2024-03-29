;; This channel file can be passed to 'guix pull -C' or to
;; 'guix time-machine -C' to obtain the Guix revision that was
;; used to populate this profile.

(use-modules
(guix channels))

  (cons

      (channel
        ; see: https://gitlab.com/nonguix/nonguix
        (name 'nonguix) ; nonfree kernel, binary build system, clojure, dotnet, wine
        (url "https://gitlab.com/nonguix/nonguix.git")
        ;; Enable signature verification:
        (introduction
          (make-channel-introduction 
            "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
            (openpgp-fingerprint 
            "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5")))) 


    ;  (channel
    ;    (name 'science)
    ;    (url "https://github.com/guix-science/guix-science.git")) ; Rstudio

      ;(channel
      ;  (name 'gorilla)
      ;  (url "https://github.com/clojure-quant/gorilla-guix-chan")) ; babashka + vs-codium

     ; (channel ; extra home services
     ;   (name 'rde) ; https://sr.ht/~abcdw/rde/
     ;   (url "https://git.sr.ht/~abcdw/rde")
     ;   (introduction
     ;    (make-channel-introduction
     ;     "257cebd587b66e4d865b3537a9a88cccd7107c95"
     ;     (openpgp-fingerprint
     ;      "2841 9AC6 5038 7440 C7E9  2FFA 2208 D209 58C1 DEB0"))))

    ;(channel 
    ;   (name 'pipewire)
    ;   (url "https://github.com/yellowsquid/squidguix"))
  
      ;(channel
      ;  (name 'pantherx)
      ;  (url "https://channels.pantherx.org/git/pantherx-extra.git")) ; vs-codium

    ;
    %default-channels  
  )
