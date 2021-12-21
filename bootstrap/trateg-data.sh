#!/bin/sh

cd /home/shared/repo/clojure-quant/trateg/app/demo

clj -X:run :task :alphavantage-import :symbol "test"
clj -X:run :task :alphavantage-import :symbol "fidelity-select"

clj -X:run :task :alphavantage-import :symbol "bonds"
clj -X:run :task :alphavantage-import :symbol "currency"
clj -X:run :task :alphavantage-import :symbol "currency-spot"

clj -X:run :task :alphavantage-import :symbol "equity-region"
clj -X:run :task :alphavantage-import :symbol "equity-region-country"
clj -X:run :task :alphavantage-import :symbol "equity-sector"
clj -X:run :task :alphavantage-import :symbol "equity-sector-industry"
clj -X:run :task :alphavantage-import :symbol "equity-style"

clj -X:run :task :alphavantage-import :symbol "reit"
clj -X:run :task :alphavantage-import :symbol "commodity-sector"
clj -X:run :task :alphavantage-import :symbol "commodity-industry"
clj -X:run :task :alphavantage-import :symbol "commodity-industry"

