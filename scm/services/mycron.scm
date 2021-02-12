(use-modules ;(guix) 
;             (gnu) 
             (gnu services mcron)
  ;           (shepherd service)
)

(use-package-modules base idutils 
 mcron
)


;(define hello-job
;  #~(job '(next-minute '(1))
;         (lambda ()
;           (execl "echo"
;                  "hello > /tmp/hello.txt"))))

(define hello-job1
  (job
   '(next-minute-from
      (next-hour (range 0 24 2))
      15)
   "my-program"))


;(define mycron1
; (simple-service 'my-mcron-job mcron-service-type
;                #~(job '(next-hour (3)) "guix gc -F 2G")))
(hello-job1)



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
;            (jobs (list hello-job )))))


;(register-services mycron1)

; (start mycron1)

