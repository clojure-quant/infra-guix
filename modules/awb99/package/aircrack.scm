

; removed from guix.
; https://gitlab.com/nonguix/nonguix/-/issues/213

(define-public rtl8821ce-linux-module
(let ((commit "be733dc86781c68571650b395dd0fa6b53c0a039")
      (revision "6"))
  (package
    (name "rtl8821ce-linux-module")
    (version (git-version "0.0.0" revision commit))
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tomaspinho/rtl8821ce")
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "00sd7s0582b9jcpfgy0fw6418dwg700mfyizkfr22jf2x140iy70"))))
    (build-system linux-module-build-system)
    (arguments
     (list #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "KSRC="
                                  (assoc-ref %build-inputs
                                             "linux-module-builder")
                                  "/lib/modules/build"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'build
                 (lambda* (#:key (make-flags '()) (parallel-build? #t)
                                 #:allow-other-keys)
                   (apply invoke "make"
                          `(,@(if parallel-build?
                                  `("-j" ,(number->string (parallel-job-count)))
                                  '())
                            ,@make-flags)))))
           #:tests? #f))                  ; no test suite
    (home-page "https://github.com/tomaspinho/rtl8821ce")
    (synopsis "Linux driver for Realtek RTL8821CE wireless network adapters")
    (description "This is Realtek's RTL8821CE Linux driver for wireless
network adapters.")
    (license license:gpl2))))

(define-public rtl8812au-aircrack-ng-linux-module
(let ((commit "6d0d9fb56d4d918012a5c7a030b9233cad039cdd")
      (revision "8"))
  (package
    (inherit rtl8821ce-linux-module)
    (name "rtl8812au-aircrack-ng-linux-module")
    (version (git-version "5.6.4.2" revision commit))
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/aircrack-ng/rtl8812au")
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "012asiy43ik13kl9p97sscdsqq5jihq73s4ws3g5wqqczqcgrsvc"))
       (modules '((guix build utils)))
       (snippet
        #~(begin
            ;; Remove bundled tarballs, APKs, word lists, speadsheets,
            ;; and other unnecessary unlicenced things.
            (for-each delete-file-recursively (list "android"
                                                    "docs"
                                                    "tools"))))))
    (supported-systems '("x86_64-linux" "i686-linux"))
    (home-page "https://github.com/aircrack-ng/rtl8812au")
    (synopsis "Linux driver for Realtek USB wireless network adapters")
    (description
     "This is Realtek's rtl8812au Linux driver for USB 802.11n wireless
network adapters, modified by the aircrack-ng project to support monitor mode
and frame injection.  It provides a @code{88XXau} kernel module that supports
RTL8812AU, RTL8821AU, and RTL8814AU chips.")
    (license license:gpl2+))))