#!/bin/sh

cat /home/user-data/mail/sieve/global_before/global.sieve 
cat /etc/dovecot/sieve-spam.sieve

cat /var/log/mail.log | grep sieve
tail /var/log/mail.log -n 2000 | grep "auth failed"


tail /var/log/mail.log -n 500

cat /var/log/syslog


ls /home/user-data/mail/mailboxes

 
  466  tail /var/log/mail.log -n 200
  467  tail /var/log/syslog -n 200
  468  cat /etc/postfix/main.cf
  473  cat /etc/postfix/dynamicmaps.cf 
  474  cat /etc/postfix/sender-login-maps.cf 
  475  cat /etc/postfix/virtual-mailbox-maps.cf 
  476  cat /etc/postfix/master.cf 
  480  cat /etc/postfix/master.cf | grep bcc
  481  cat /etc/postfix/main.cf | grep bcc