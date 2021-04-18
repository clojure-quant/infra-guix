;; This channel file can be passed to 'guix pull -C' or to
;; 'guix time-machine -C' to obtain the Guix revision that was
;; used to populate this profile.

(list
     ;; Note: these other commits were also used to install some of the packages in this profile:
     ;;   "a30f250d7426df48f5532cd339b8f53dd6e4dd3a"
     (channel
       (name 'guix)
       (url "https://git.savannah.gnu.org/git/guix.git")
       (commit
         "84feaca4888c9916e1a97bb81e5d157673488b70")
       (introduction
         (make-channel-introduction
           "9edb3f66fd807b096b48283debdcddccfea34bad"
           (openpgp-fingerprint
             "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA"))))
     (channel
       (name 'nonguix)
       (url "https://gitlab.com/nonguix/nonguix")
       (commit
         "05fad6e54d497b7427ab7ea488210c7d43c3f676")
       (introduction
         (make-channel-introduction
           "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
           (openpgp-fingerprint
             "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
)
