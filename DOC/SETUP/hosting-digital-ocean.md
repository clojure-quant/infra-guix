
## setup a new machine at digital ocean

1. on your pc in infra-guix:
bb ocean-image

2. upload image to digital-ocean

3. start a new droplet

4. on your pc in infra-guix:
bb ocean-init 
this copies secrets to the machine

5. sudo bash /home/shared/clojure-quant/infra-guix/bootstrap/trateg-resize.sh