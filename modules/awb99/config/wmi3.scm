
; window manager i3



(define i3-service
(simple-service
  'i3-packages
  profile-service-type
  (list dmenu i3-wm i3lock i3status)))