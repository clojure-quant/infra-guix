(use-modules
(awb99 packages tools)
(awb99 packages fonts)
(awb99 packages wm)
(awb99 packages desktop)
(awb99 packages programming)
(awb99 packages fonts))

(define-public desktop-packages
(append 
  '()
  font-packages
  ;virtual-machine-packages
  '("mc")
  ; ********************  desktop
  desktop-chat-packages
  desktop-multimedia-packages
  desktop-office-packages
  desktop-browser-packages 
  desktop-tool-packages
))


(specifications->manifest desktop-packages)

