

;; cron format: minute hour day-of-month month day-of-week
;; TODO: migrate crons to clearer syntax:   #~(job '(next-hour '(3)) (string-append #$btrfs-progs "/bin/btrfs scrub start -c 3 /")))
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

(define renice-guix-daemon-job
  ;; renice guix-daemon to prevent competing with work
  #~(job "* 7 * * *" "sleep 300; pgrep guix-daemon | xargs renice -n 10"))

(define guix-reconfigure-job
  ;; gc (remove packages older than 2 months, keep at least 500G free), pull and update every day at 03:05
  #~(job "5 3 * * *"            ;Vixie cron syntax
         "guix gc --optimize -d 2m && guix gc -F 500G && guix pull && guix system reconfigure -k /etc/config.scm"))

(define guix-release-throttle-job
  ;; release CPU throttle at 3:00, just before guix reconfigure starts
  #~(job "0 3 * * *"            ;Vixie cron syntax
         "cpupower frequency-set -g powersave -u 6000000"))


(define arnebab-org-publish-job
  ;; gc (publish my website every day at 02:00
  #~(job "* 2 * * *"            ;Vixie cron syntax
         "su - MYSELF bash -c 'cd ~/Schreibtisch/arnebab-org && make && hg push sr.ht && hg push'"))
