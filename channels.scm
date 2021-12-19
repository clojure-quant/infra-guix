;; This channel file can be passed to 'guix pull -C' or to
;; 'guix time-machine -C' to obtain the Guix revision that was
;; used to populate this profile.

; (append
  (list

      (channel
        (name 'guix)
        (url "https://git.savannah.gnu.org/git/guix.git"))

      (channel
        (name 'nonguix) ; binary build system, clojure, dotnet, wine
        (url "https://gitlab.com/nonguix/nonguix.git")
        ;; Enable signature verification:
        (introduction
          (make-channel-introduction "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
            (openpgp-fingerprint "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5")))) 

    ;  (channel
    ;    (name 'science)
    ;    (url "https://github.com/guix-science/guix-science.git")) ; Rstudio

      (channel
        (name 'gorilla)
        (url "https://github.com/pink-gorilla/gorilla-guix-chan")) ; babashka + vs-codium

;      (channel
;        (name 'pantherx)
;        (url "https://channels.pantherx.org/git/pantherx-extra.git")) ; vs-codium

      
  )
  
  ; %default-channels)
