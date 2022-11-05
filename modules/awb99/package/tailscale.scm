(define-module (awb99 package tailscale)
#:use-module ((guix licenses) #:prefix license:)
#:use-module (guix packages)
#:use-module (gnu packages base)
#:use-module (guix download)
#:use-module (guix utils)
#:use-module (gnu packages gcc)
#:use-module (gnu packages compression)
#:use-module (nonguix build-system binary))

; guix build -f ./modules/awb99/package/tailscale.scm

; "https://pkgs.tailscale.com/stable/tailscale_${V}_${ARCH}.tgz"

; https://pkgs.tailscale.com/stable/tailscale_1.32.2_amd64.tgz
; tar -xf 

(define a "amd64")

(define-public tailscale
  (package
    (name "tailscale")
    (version "1.32.2")
    (source 
      (origin
        (method url-fetch)
        (uri (string-append "https://pkgs.tailscale.com/stable/tailscale_" 
                            version "_" a ".tgz"))
        (sha256
          (base32 "1vff453qnd2aphb89j7mzz7qcpxgc73k62ibjdi3im4rnpqq3m9b"))))
    (build-system binary-build-system)
    (supported-systems '("x86_64-linux" "i686-linux"))
    (arguments
      `(#:patchelf-plan
           `()
          ;`(("tailscale_1.32.2_amd64/tailscaled"
          ;  ("libc" "zlib" "libstdc++")))
        #:install-plan
              `(("." "bin/"))
          
        ;#:phases
        ; (modify-phases %standard-phases
        ;   ;; this is required because standard unpack expects
        ;   ;; the archive to contain a directory with everything inside it,
        ;   ;; while babashka's release .tar.gz only contains the `bb` binary.
        ;  (replace 'unpack
        ;    (lambda* (#:key inputs outputs source #:allow-other-keys )
        ;      (invoke "tar" "xvf" source)
        ;     #t)))
        
      #:phases
       (modify-phases %standard-phases
           (add-after 'unpack 'chmod
            (lambda _
               (let* ((bin-dir (string-append %output "/bin"))
                      (tar-dir (string-append bin-dir "/tailscale_1.32.2_amd"))
                      (tailscaled1 (string-append %output "/tailscale_1.32.2_amd/tailscaled"))
                      (tailscaled (string-append bin-dir "/tailscaled")))
                  (display " bin dir: ")
                  (display bin-dir) 
                  (display " tar dir: ")
                  (display tar-dir)
                  ;(mkdir-p bin-dir)
                   ;(copy-file tailscaled1 tailscaled)
                   #t))
            
            ))))
    (inputs
       `(("libstdc++" ,(make-libstdc++ gcc))
          ("zlib" ,zlib)))
    (native-inputs
       `(("tar" ,tar)))
    (synopsis "tailscale - config tool for wireguard")
    (description "")
    (home-page "https://tailscale.com/download/linux/static")
    (license license:epl1.0)))

tailscale

