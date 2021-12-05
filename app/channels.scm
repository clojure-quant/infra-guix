;; This channel file can be passed to 'guix pull -C' or to
;; 'guix time-machine -C' to obtain the Guix revision that was
;; used to populate this profile.

; (append
  (list

      (channel
        (name 'guix)
        (url "https://git.savannah.gnu.org/git/guix.git"))

      (channel
        (name 'gorilla)
        (url "https://github.com/pink-gorilla/gorilla-guix-chan")) ; rdesktop
  )
  
  ; %default-channels)
