(use-modules (gnu)
             (guix)
             (gorilla packages)
             (gorilla guixutils)
             (gorilla services)
             )


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


(display "sshd service")
(newline)
(display (gorilla-ssh-service))
