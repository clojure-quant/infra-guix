service nsd restart


  853  cd /home/user-data/mail/sieve/global_before/
  854  nano global.sieve 
  855  tail /var/log/mail.log -n 200
  856  ls
  857  cd /home/user-data/mail/mailboxes


  879  cd /var/log
  740  tail /var/log/mail.log -n 2000 | grep "auth failed"



  465  nano global.sieve
  466  tail /var/log/mail.log -n 200
  467  tail /var/log/syslog -n 200
  468  cat /etc/postfix/main.cf
  469  cat /etc/
  470  ls /etc/
  471  ls /etc/postfix
  472  ls /etc/postfix/dynamicmaps.cf 
  473  cat /etc/postfix/dynamicmaps.cf 
  474  cat /etc/postfix/sender-login-maps.cf 
  475  cat /etc/postfix/virtual-mailbox-maps.cf 
  476  cat /etc/postfix/master.cf 
  477  ls /etc/postfix/
  478  ls /etc/postfix/main.cf
  479  nano /etc/postfix/master.cf 
  480  cat /etc/postfix/master.cf | grep bcc
  481  cat /etc/postfix/main.cf | grep bcc
  482  cat /etc/postfix/main.cf
  483  cat /etc/postfix/main.cf 
  484  cat /etc/postfix/main.cf | grep bcc
  485  nano /etc/postfix/main.cf
  486  cat /etc/postfix/main.cf

https://discourse.mailinabox.email/t/when-does-a-full-backup-occur/3174/2
To delete OLD encrypted backup files if stored locally, use:
rm /home/user-data/backup/encrypted/*

To manually recreate a new full encrypted backup use:
/root/mailinabox/management/backup.py --full




