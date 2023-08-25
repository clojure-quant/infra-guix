# trateg

Runs quant.hoertlehner.com

ssh port: 22
http: 8080  (gets forwarded via iptables to 80)
https: 8443 (gets forwarded via iptables to 443)

# trateg dirs

- /var/log/trateg  logfiles
- /var/trateg  persistent storage
    /db     database
    /series timeseries 
   

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


