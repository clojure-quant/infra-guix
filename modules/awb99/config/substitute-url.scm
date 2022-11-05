


(define my-substitute-urls
(list "https://ci.guix.gnu.org"
      ;"http://bp7o7ckwlewr4slm.onion" ; ci.guix.gnu.org
      "https://bayfront.guix.gnu.org"
      "https://bordeaux.guix.gnu.org"
      "http://guix.genenetwork.org"
      "https://guix.tobias.gr"))

--substitute-urls=urls
;; Assume we're starting from '%desktop-services'.  Replace it
    ;; with the list of services you're actually using.
    (modify-services %desktop-services
      (guix-service-type config =>
                        (guix-configuration
                          (inherit config)
                          (substitute-urls
                            (append (list "https://guix.example.org")
                                    %default-substitute-urls))
                          (authorized-keys
                            (append (list (local-file "./key.pub"))
                                    %default-authorized-guix-keys)))))))

Now, in addition to ci.guix.gnu.org, bordeaux.guix.gnu.org is a default substitute server.


> If there's effort put in to getting substitutes served from bayfront,
http://bayfront.guix.gnu.org
berlin.guix.gnu.org.pub


Hit it
Download my public key.
On Guix System, add the file to guix-service-type's authorized-keys.
Otherwise, pipe it into guix archive --authorize.
Now add "https://guix.tobias.gr" to the end of your substitute-urls. That's


https://guix.tobias.gr	(public-key (ecc (curve Ed25519) (q #628CD75C05C78223317092AFDCBE7130D363ACA938114A067F4F9DCF346B59DB#)))

https://guix.cbaines.net	(public-key (ecc (curve Ed25519) (q #5F5F4F321533D3A38F909785E682798933BA9BE257C97E5ABC07DD08F27B8DBF#)))

;(guix-service-type
;config => (guix-configuration
;(inherit config)
;(substitute-urls %my-substitute-urls)
;(extra-options '("--max-jobs=4"))))