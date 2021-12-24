# trateg

Runs quant.hoertlehner.com

ssh port: 22
http: 8080  (gets forwarded via iptables to 80)
https: 8443 (gets forwarded via iptables to 443)

## setup a new machine at digital ocean

1. on your pc in infra-guix:
bb ocean-image

2. upload image to digital-ocean

3. start a new droplet

4. on your pc in infra-guix:
bb ocean-init 
this copies secrets to the machine

5. sudo bash /home/shared/clojure-quant/infra-guix/bootstrap/trateg-resize.sh

## website herd service - trateg/goldly -docs

sudo herd status trateg
sudo cat /home/shared/goldly.log
sudo herd enable trateg
sudo herd start trateg

## admin trateg

cd /home/shared/repo/clojure-quant/infra-guix
git pull
bb ocean-reconfigure
this reconfigures the entire machine.


## trateg data tasks

cd /home/shared/repo/clojure-quant/trateg

to see available tasks: `bb tasks`

**data import**

```
bb alphavantage-import test
bb alphavantage-import all-stocks

```

**gann charts**

bb gann-tvcharts


