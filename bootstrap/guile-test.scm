

(use-modules 
(gnu packages finance)  ; trezord-udev-rules
)

(display 
  (append 
    (list 1 2)
    (list 3 4)
    (list 5 6)

  ))


(display
   (cons* 
     3
     4
     5
     6
     (list 1 2)
  ))

(define machine "nuc2022")

(display
  (cond 
    ((string=? machine "nuc") "running on nuc")
    ((string=? machine "nuc2022") "running on nuc2022!!")
    ((string=? machine "rock") "an arm machine")
    (#t  "not found!")
  )

)

