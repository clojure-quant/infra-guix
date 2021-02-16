#!/bin/bash

clear
pidstat -C chrome  -r
pidstat -C node  -r

echo ""
ps -aux | grep node
