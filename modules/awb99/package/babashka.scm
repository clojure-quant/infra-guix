(define-module (awb99 package babashka)
#:use-module ((guix licenses) #:prefix license:)
#:use-module (guix packages)
#:use-module (gnu packages base)
#:use-module (guix download)
#:use-module (guix utils)
#:use-module (gnu packages gcc)
#:use-module (gnu packages compression)
#:use-module (nonguix build-system binary))

; guix build -f ./modules/awb99/package/babashka.scm

; https://github.com/babashka/babashka/releases/download/v1.0.165/babashka-1.0.165-linux-amd-static.tar.gz

; tar -xf 

(define-public babashka
  (package
    (name "babashka")
    (version "1.0.165")
    (source 
      (origin
        (method url-fetch)
        (uri (string-append "https://github.com/babashka/babashka/releases/download/v" 
                   version "/babashka-" version "-linux-amd64.tar.gz"))
        (sha256
          (base32 "1zc0iwr22srxgrz96965jmq7142nxwygv86l51p41f3ndzdzwrmb"))))
    (build-system binary-build-system)
    (supported-systems '("x86_64-linux" "i686-linux"))
    (arguments
      `(#:patchelf-plan
          `(("bb"
            ("libc" "zlib" "libstdc++")))
        #:install-plan
          `(("." ("bb") "bin/"))
        #:phases
         (modify-phases %standard-phases
           ;; this is required because standard unpack expects
           ;; the archive to contain a directory with everything inside it,
           ;; while babashka's release .tar.gz only contains the `bb` binary.
          (replace 'unpack
            (lambda* (#:key inputs outputs source #:allow-other-keys )
              (invoke "tar" "xvf" source)
             #t)))))
    (inputs
       `(("libstdc++" ,(make-libstdc++ gcc))
          ("zlib" ,zlib)))
    (native-inputs
       `(("tar" ,tar)))
    (synopsis "A Clojure babushka for the grey areas of Bash")
    (description
       "The main idea behind babashka is to leverage Clojure in places
        where you would be using bash otherwise.")
    (home-page "https://github.com/babashka/babashka")
    (license license:epl1.0)))

babashka

