(use-modules (gorilla packages)
             (gorilla guixutils))


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


