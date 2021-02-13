(define-module (services mycron))

; https://www.gnu.org/software/mcron/manual/mcron.html#Guile-Simple-Examples
; https://www.gnu.org/software/mcron/manual/html_node/The-job_002dspecifier-module.html#The-job_002dspecifier-module
; https://www.gnu.org/software/mcron/manual/mcron.html#Guile-Simple-Examples
; https://guix.gnu.org/manual/en/html_node/Scheduled-Job-Execution.html
; https://git.savannah.gnu.org/cgit/guix.git/tree/gnu/packages/guile-xyz.scm#n2552

(use-modules ;(guix) 
             ;(gnu) 
             (gnu services mcron)
             (mcron scripts mcron)
             (mcron base)
             (mcron config)
             (mcron job-specifier)    ; For user/system files.
             (mcron utils)
             (mcron vixie-specification)
              (mcron core)
             ;(mcron)
  ;           (shepherd service)
   (oop goops)      ;; Defining classes and methods.

(shepherd)
  (shepherd config)
   (shepherd support)
    (shepherd service)
   (shepherd system)
   (shepherd args)
   (shepherd comm)

)

;(use-package-modules 
;base idutils 
; mcron
;)


;(define hello-job
;  #~(job '(next-minute '(1))
;         (lambda ()
;           (execl "echo"
;                  "hello > /tmp/hello.txt"))))


(define hello-job1
  (job
   '(next-hour '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23))
   "echo `date` >> /tmp/d.txt"))
(display hello-job1)

;(define mycron1
; (simple-service 'my-mcron-job mcron-service-type
;                #~(job '(next-hour (3)) "guix gc -F 2G")))

(add-job hello-job1)


;(operating-system
  ;; …
 ; (services (cons (service mcron-service-type
  ;                         (mcron-configuration
   ;                         (jobs (list hello-job
                                        
    ;                                    ))))
     ;             %base-services)))



;(define mycron1
;   (service mcron-service-type
;       (mcron-configuration
;            (jobs (list hello-job1 )))))


;(register-services hello-job1)

(start mycron1)

(display "crone setup.")
