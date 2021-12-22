# trateg

Runs on quant.hoertlehner.com

http: 8080


## bootstrapping

cd /home/shared/repo/clojure-quant/infra-guix
bb ocean-reconfigure

bootstrap/

## website herd service - trateg/goldly -docs

sudo herd status trateg
sudo cat /home/shared/goldly.log


## trateg

cd /home/shared/repo/clojure-quant/trateg

to see available tasks: `bb tasks`

**data import**

```
bb alphavantage-import test
bb alphavantage-import fidelity-select

bb alphavantage-import bonds
bb alphavantage-import currency
bb alphavantage-import  currency-spot

bb alphavantage-import equity-region
bb alphavantage-import equity-region-country
bb alphavantage-import equity-sector
bb alphavantage-import equity-sector-industry
bb alphavantage-import equity-style

bb alphavantage-import reit
bb alphavantage-import commodity-sector
bb alphavantage-import commodity-industry
```

**gann charts**

bb gann-tvcharts


