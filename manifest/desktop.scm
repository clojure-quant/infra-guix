(use-modules
(awb99 packages desktop))

(define-public desktop-packages
(append 
   desktop-chat-packages
  desktop-multimedia-packages
  desktop-office-packages
  desktop-browser-packages 
  desktop-tool-packages
))


(specifications->manifest desktop-packages)

