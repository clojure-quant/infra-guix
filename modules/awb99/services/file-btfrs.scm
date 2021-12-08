




; Make sure to btrfs balance every day to ensure your data are not getting too fragmented,
; which could cause problems with metadata space; I have a crontab entry with
; btrfs balance -dusage=50 -dlimit=2 at midnight 
; on another, non-Guix system (the BTRFS mount is not / there, just some rather important data that needs to be kept alive). 

; Also, make sure to btrfs scrub at least once a week. 

; And never turn on nodatacow or chattr +C unless you are more 
; concerned about performance than reliability (at which point you should switch to XFS anyway
