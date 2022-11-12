(define-module (awb99 config cron guix)
  #:export (job-guix-pull-gc-reconfigure)
)

(use-modules
  (guix gexp) ;brings #~     #~ means ‘[begin a] gexp’, short for G-Expression
  (gnu services mcron)
)

;; GUIX RELATED

(define job-guix-pull-gc
; gc (remove packages older than 6 months.
; keep at least 500G free)
; pull
; run daily at 03:05
#~(job "5 3 * * *"            ;Vixie cron syntax
       "guix gc --optimize -d 2m && guix gc -F 300G && guix pull")
 )

(define job-guix-pull-gc-reconfigure
; gc - remove packages older than 6 months
; gc - keep at least 500G free)
; pull
; update system
  #~(job ; "5 3 * * *"  ; daily at 03:05
	 "5 3 * * 6" ; every saturday at 03:05
    "guix gc --optimize -d 6m && guix gc -F 500G && guix pull && guix system reconfigure -k /etc/config.scm"))

(define job-guix-renice-daemon
;; renice guix-daemon to prevent competing with work
#~(job "* 7 * * *" "sleep 300; pgrep guix-daemon | xargs renice -n 10"))

