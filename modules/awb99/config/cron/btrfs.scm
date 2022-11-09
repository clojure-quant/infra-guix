(define-module (awb99 config cron btrfs))

; btrfs advantages:
; - not being susceptible to the EXT4 inodes exhaustion problem
; - zstd compression which can almost double the actual capacity
;   of a storage device at little computation cost

;  Btrfs balance mcron job
; To ensure it operates without manual intervention, a balance job
; should run periodically to ensure the unallocated space (a
; Btrfs-specific concept) remains in check with the actual free space.
; Otherwise, the system could report ~ENOSPC~ even when common utilities
; such as ~df -h~ report plenty of free space.  To view the amount of
; available unallocated space, the ~btrfs filesystem usage /~ can be
; used.

;; BTFRS RELATED

; from: https://git.savannah.gnu.org/cgit/guix/maintenance.git/tree/hydra/monokuma.scm
(define btrfs-balance-job
;; Re-allocate chunks which are using less than 5% of their chunk
;; space, to regain Btrfs 'unallocated' space.  The usage is kept
;; low (5%) to minimize wear on the SSD.  Runs at 5 AM every 3 days.
#~(job '(next-hour-from (next-day (range 1 31 3)) '(5))
       (lambda ()
         (execl #$(file-append btrfs-progs "/bin/btrfs") "btrfs"
                "balance" "start" "-dusage=5" "/"))
       "btrfs-balance"))



; this job is currently not used.
(define job-btfrs-scrub
#~(job 
    '(next-hour '(3)) 
     (string-append #$btrfs-progs "/bin/btrfs scrub start -c 3 /")))







