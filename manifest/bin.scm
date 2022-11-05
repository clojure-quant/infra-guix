(use-modules
  (awb99 guixutils) 
  (awb99 package babashka)
  (awb99 package tailscale)

)


(packages->manifest 
  (list
    babashka
    tailscale
   ))