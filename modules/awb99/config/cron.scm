(define-module (awb99 config cron))

(use-modules
  ;(guix) 
   (gnu) 
   (guix gexp) ;brings #~     #~ means ‘[begin a] gexp’, short for G-Expression
   (gnu packages linux)
   (gnu packages base)
   (gnu packages idutils)
   (gnu services)
   (gnu services mcron)
  ; (mcron scripts mcron)
   ;(mcron base)
   ;(mcron config)
   ;(mcron job-specifier)    ; For user/system files.
   ;(mcron utils)
   ;(mcron vixie-specification)
   ;(mcron core)
   ;(mcron)\
  (awb99 config cron guix)
  (awb99 config cron btrfs)
)

; https://www.gnu.org/software/mcron/manual/mcron.html#Guile-Simple-Examples
; https://www.gnu.org/software/mcron/manual/html_node/The-job_002dspecifier-module.html#The-job_002dspecifier-module
; https://guix.gnu.org/manual/en/html_node/Scheduled-Job-Execution.html
; https://git.savannah.gnu.org/cgit/guix.git/tree/gnu/packages/guile-xyz.scm#n2552

; stolen from:
; https://git.sr.ht/~efraim/guix-config/tree/master/item/config/filesystems.scm




;; cron format: minute hour day-of-month month day-of-week
;; TODO: migrate crons to clearer syntax:   
(define cpupower-powersave-job
;; Set the governor to powersave every minute, except for the time
;; between 3 and 5 to permit rebuilding. This reduces my
;; power-consumption from 120W to 30W.
#~(job "* 0-2,5-23 * * *"            ;Vixie cron syntax
       "cpupower frequency-set -g powersave -u 1200000")) ;; use powersave governor with a maximum frequency of 1200MHz

(define lift-nofile-limit-job
;; Lift the maximum open files restriction for all processes every 30 minutes
#~(job "0-59/30 * * * *"            ;Vixie cron syntax
       "for i in $(pgrep .); do sudo prlimit --pid $i --nofile=1000000:1000000; done"))

;(define arnebab-org-publish-job
;; gc (publish my website every day at 02:00
;#~(job "* 2 * * *"            ;Vixie cron syntax
;       "su - MYSELF bash -c 'cd ~/Schreibtisch/arnebab-org && make && hg push sr.ht && hg push'"))


;; used in desktop + vm-terminal

(define-public my-guix-maintenance-jobs
  (list
     job-guix-pull-gc-reconfigure
     job-btrfs-balance
     ; hello-job
     ))

(define-public service-cron
  (service mcron-service-type
    (mcron-configuration
     (jobs my-guix-maintenance-jobs))))


              