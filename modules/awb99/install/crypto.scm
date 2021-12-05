(define-module (awb99 install crypto)
  #:export (my-crypto))

(define my-crypto
  (list 

    "trezord"  ; gnu/packages/finance.scm:1277:2  https://github.com/trezor/trezord-go
    "trezord-udev-rules"   ; run trezord as normal (non root) user  https://github.com/trezor/trezor-common
    "trezor-agent"  ; trezor as ssh  / gpg agent   https://github.com/romanz/trezor-agent

    ; "electrum" ; bitcoin wallet   https://electrum.readthedocs.io/en/latest/hardware-linux.html#udev-rules
    ; "electron-cash" ; https://github.com/Electron-Cash/Electron-Cash Bitcoin Cash client


    ; "ledger-agent"  ; https://github.com/romanz/trezor-agent   does trezor and ledger

    ; "python-trezor"  ;  https://github.com/romanz/trezor-agent  https://github.com/trezor/python-trezor
    ; "python-ledgerblue"   ; blue/nano s
    ; "python-trezor-agent"
    ; python-btchip-python
   
    ; python-keepkey  ; https://github.com/keepkey/python-keepkey


   ))


; to see package source code:
; guix edit trezord 

;; create a plugdev group and add the trezord user to that group
; 
;