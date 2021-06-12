;; This channel file can be passed to 'guix pull -C' or to
;; 'guix time-machine -C' to obtain the Guix revision that was
;; used to populate this profile.


(cons (channel
        (name 'giuliano108-guix-packages)
        (url "https://github.com/giuliano108/guix-packages"))
      %default-channels)