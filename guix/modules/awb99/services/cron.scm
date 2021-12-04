(define-module (awb99 services cron)
               #:use-module (oop goops)  ; Defining classes and methods.
               #:use-module (shepherd service) ; service
               #:export (myservice-cron2)
               )

(use-modules ;(guix) 
             (gnu) 
             (gnu services mcron) ; identical to: (use-service-modules mcron)
             (mcron scripts mcron)
             (mcron base)
             (mcron config)
             (mcron job-specifier)    ; For user/system files.
             (mcron utils)
             (mcron vixie-specification)
             (mcron core)
             ;(mcron)
)

(use-package-modules base idutils)


; https://www.gnu.org/software/mcron/manual/mcron.html#Guile-Simple-Examples
; https://www.gnu.org/software/mcron/manual/html_node/The-job_002dspecifier-module.html#The-job_002dspecifier-module
; https://guix.gnu.org/manual/en/html_node/Scheduled-Job-Execution.html
; https://git.savannah.gnu.org/cgit/guix.git/tree/gnu/packages/guile-xyz.scm#n2552




(define garbage-collector-job
  ;; Collect garbage 5 minutes after midnight every day.
  ;; The job's action is a shell command.
  #~(job "5 0 * * *"            ;Vixie cron syntax
         "guix gc -F 1G"))


(define myservice-cron
   (service mcron-service-type
       (mcron-configuration
          (jobs (list 
                  ; hello-job1
                  hello-job3
                 ;guix-reconfigure-job
           )))))

(define myservice-cron2
    (simple-service 'my-cron-jobs
                    mcron-service-type
                    (list garbage-collector-job
                          ;updatedb-job
                          ;idutils-job
                          )))