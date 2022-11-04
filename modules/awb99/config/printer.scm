(define-module (awb99 config printer)
  #:export (service-printer))

(use-modules 
  (gnu packages cups)
  (gnu services)
  (gnu services cups))

  ; printer: HP LJ Pro MFP M148fdw MFG Laser
  ; https://developers.hp.com/hp-linux-imaging-and-printing
  ; guix install hplip
  ; HP LaserJet m14-m17, hpcups 3.21.10
(define service-printer
  (service cups-service-type
    (cups-configuration
      (default-paper-size "A4")
      (web-interface? #t)
      (extensions
        (list cups-filters hplip splix )))))

    
