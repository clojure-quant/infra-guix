(define-module (awb99 config substitute-url)
#:use-module (gnu)
#:export (add-nonguix-substitutes))


; see: https://github.com/nonguix/nonguix

(define (add-nonguix-substitutes my-desktop-services)
  (modify-services my-desktop-services
    (guix-service-type config => (guix-configuration
       (inherit config)
       (substitute-urls
                (append (list "https://substitutes.nonguix.org")
                  %default-substitute-urls))
       (authorized-keys
                (append (list (local-file "../../../nonguix-signing-key.pub")) ; relative to this file
                  %default-authorized-guix-keys))))))

