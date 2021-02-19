(use-modules (gnu)
             (guix)
             (guix packages)
             (ice-9 pretty-print)
             (gorilla packages)
             (gorilla guixutils)
             (gorilla services)
             (gorilla tweak-r))


(display "gorilla package names:")
(newline)
(display p-notebook)
(newline)


(display "gorilla packages:")
(newline)
(display (->packages p-notebook))
(newline)

(display "gorilla manifests:")
(newline)
(display (->manifests p-notebook))
(newline)

(display "base packages")
(newline)
;(display %base-packages)
;(newline)
(display (map package-name %base-packages))
(newline)


;(display "sshd service")
;(newline)
;(display (gorilla-ssh-service))


(display "r-max")
(newline)
;(display r-maximal)
;(display (package->bag r-maximal))
(display (pretty-print (package->bag r-maximal)))