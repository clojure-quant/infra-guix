


; https://github.com/leibniz-psychology/psychnotebook-deploy/blob/master/src/zpid/machines/yamunanagar/os.scm


  (service unattended-upgrade-service-type
  (unattended-upgrade-configuration
   (channels #~(cons* (channel
                       (name 'psychnotebook-deploy)
                       (url "https://github.com/leibniz-psychology/psychnotebook-deploy.git")
                       (introduction
                        (make-channel-introduction
                         "02ae8f9f647ab9650bc9211e728841931f25792c"
                         (openpgp-fingerprint
                          "CA4F 8CF4 37D7 478F DA05  5FD4 4213 7701 1A37 8446"))))
                %default-channels))
    (operating-system-file
     (scheme-file "config.scm"
       #~(@ (zpid machines yamunanagar os) yamunanagar-os)))
    (system-expiration (* 1 30 24 60 60)) ; Expire after one month.
    (schedule "55 13 * * *")))