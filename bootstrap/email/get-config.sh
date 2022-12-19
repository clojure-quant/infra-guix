#!/bin/sh

export to=$MYVAULT/emailserver
export from=/home/user-data/mail/sieve/global_before/global.sieve
scp florian@box.hoertlehner.com:$from $to

export from="/home/user-data/mail/sieve/crbclean.com/florianh.sieve"
# scp root@box.hoertlehner.com:$from $to
# error runing as root