;; This channel file can be passed to 'guix pull -C' or to
;; 'guix time-machine -C' to obtain the Guix revision that was
;; used to populate this profile.

; (append
  (list

      (channel
        (name 'guix)
        (url "https://git.savannah.gnu.org/git/guix.git"))

      (channel
        (name 'nonguix)
        (url "https://gitlab.com/nonguix/nonguix.git")) ; binary build system, clojure, dotnet, wine

      (channel
        (name 'science)
        (url "https://github.com/guix-science/guix-science.git")) ; Rstudio

      (channel
        (name 'gorilla)
        (url "https://github.com/pink-gorilla/gorilla-guix-chan")) ; babashka + vs-codium

      
  )
  
  ; %default-channels)
