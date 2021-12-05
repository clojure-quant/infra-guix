(define-module (awb99 config cron)
#:use-module (gnu services mcron)
#:use-module (gnu packages linux)
#:use-module (guix gexp) ; #~
#:export (%guix-maintenance-jobs
          ;%guix-temproots
          ;%tmp-tmpfs
          ))

; stolen from:
; https://git.sr.ht/~efraim/guix-config/tree/master/item/config/filesystems.scm


; #~ means ‘[begin a] gexp’, short for G-Expression

(define system-garbage-job
   ;; gc (remove packages older than 2 months, keep at least 500G free), pull and update every day at 01:05
   #~(job "5 0 * * *"            ;Vixie cron syntax
          "guix gc --optimize -d 2m && guix gc -F 300G && guix pull")
    )

(define user-garbage-job
   ;; Collect garbage 5 minutes after 2am every day.
   ;; The job's action is a shell command.
   #~(job "35 0 * * *"            ;Vixie cron syntax
       "guix gc -d 5d && guix pull && guix package --upgrade"
       #:user "florian"
    ))

; (define-public hello-job
; (job
; '(next-hour '(0 15 30 45))
;  "echo `date` >> /tmp/d.txt"))

; (define-public hello-job3
;  #~(job '(next-minute '(1))
;         (lambda ()
;           (execl "echo"
;                  "hello > /tmp/hello.txt"))))


(define %guix-maintenance-jobs
(list
   system-garbage-job
   user-garbage-job
   ; hello-job
    )
  )