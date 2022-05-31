(define-module (awb99 services monitor)
  #:use-module (gnu services base) ; udev-rule
  #:export (%backlight-udev-rule))

;; Allow members of the "video" group to change the screen brightness.
(define %backlight-udev-rule
(udev-rule
 "90-backlight.rules"
 (string-append "ACTION==\"add\", SUBSYSTEM==\"backlight\", "
                "RUN+=\"/run/current-system/profile/bin/chgrp video /sys/class/backlight/%k/brightness\""
                "\n"
                "ACTION==\"add\", SUBSYSTEM==\"backlight\", "
                "RUN+=\"/run/current-system/profile/bin/chmod g+w /sys/class/backlight/%k/brightness\"")))
