mail in a box https://mailinabox.email/   6600 github stars
https://news.ycombinator.com/item?id=13050500
https://hub.docker.com/r/connor557/mailinabox/~/dockerfile/


# MY SCALEWAY MAILINABOX SERVER
VCS1 WITH Ubuntu 14.04.5 LTS Trusty Tahr
 	Box.hoertlehner.com
 	https://163.172.183.85/admin

 	Protocol/Method	IMAP
 	Mail server	Box.hoertlehner.com
 	IMAP Port	993
 	IMAP Security	SSL or TLS
 	SMTP Port	587
 	SMTP Security	STARTTLS (“always” or “required”, if prompted)
 	Username:	Your whole email address.
 	Password:	Your mail password.
 	25 (SMTP), 
  	587 (SMTP submission), 
 	993 (IMAP), 
 	995 (POP) [google pop: 
 	4190 (Sieve).


tail /var/log/mail.log -n 20
nano /home/user-data/mail/sieve/global_before/global.sieve


 	Change pwd for  user:
 	sudo /root/mailinabox/tools/mail.py user password your@address.com
Domains
  	hoertlehner.com (primary domain)
 	@scaleway: SMTP (security group: “mail” + hard reboot)
 	@scaleway: Network -> reverse: box.hoertlehner.com
	@omnis: www + box + ns1.box + ns2.box => 163.172.183.85
 	        MX: box.hoertlehner.com
 

# SPF, DKIM and DMARC

https://dmarcian.com/dmarc-inspector/?domain=crbclean.com
https://mxtoolbox.com/SuperTool.aspx?action=mx%3acrbclean.com&run=toolpage#
http://dkimvalidator.com/



# INSTALL TODO on Scaleway
https://community.online.net/t/problems-with-ufw-on-a-fresh-ubuntu/1016/3
apt-get install ufw
Edit /etc/default/ufw and set these 2 options:
 	IPV6=no
 	DEFAULT_INPUT_POLICY="ACCEPT"
Edit /etc/ufw/after.rules and add a line before COMMIT:
 	-A ufw-reject-input -j DROP
 	# don't delete the 'COMMIT' line or these rules won't be processed
 	COMMIT
Then issue these 3 commands:
ufw logging off
ufw allow ssh
ufw enable
Finally you are able to run the MIAB installation:
 	curl -s https://mailinabox.email/setup.sh | sudo bash

# TEST NS SERVER

 	yaourt -S bind-tools
 	dig @ns1.box.hoertlehner.com heureka.li

 	netstat -tap  | grep domain
 	nano /etc/nsd/nsd.conf  		
 	# ip-address: 10.3.113.19
 	ip-address: 10.3.30.9
 	service nsd restart
	service nsd status
 	tail  /var/log/syslog -n 200


# FIREWALL FAIL2BAN
service fail2ban restart

# SIEVE SCRIPTS

cat /etc/dovecot/sieve-spam.sieve
cat /var/log/mail.log | grep sieve
tail /var/log/mail.log -n 500

cat /var/log/syslog

/home/user-data/mail/sieve

cat crbclean.com/florianh.sieve
require ["fileinto","copy", "mailbox"];
# rule:[test]
if allof (header :contains "subject" "Dr Alfombra  INV-5038 is in transit")
{
	fileinto "Archive";
	stop;
}


require ["fileinto","copy", "mailbox", "envelope"];


if address :is "to" "florianh@crbclean.com"
{
    redirect :copy "hoertlehner@gmail.com";
}
 
if address :is "to" "madalynr@crbclean.com"
{
    redirect :copy " roberg.madalyn@gmail.com";
}
 
if address :is "to" "marcusw@crbclean.com"
{
    redirect :copy "marcuswendt4@gmail.com";
}
 
if address :is "to" "sebastiang@crbclean.com"
{
    redirect :copy "sebastiangstrongindustriescorp@gmail.com";
}
 
if address :is "to" "andrewe@crbclean.com"
{
    redirect :copy "andrewecrbclean@gmail.com";
}
 
# CRB CLEAN 

if address :contains "to" "@crbclean.com"
{
  redirect :copy "crb.clean@gmail.com";
}

if address :contains "from" "@crbclean.com"
{
   redirect :copy "crb.clean@gmail.com";
}

if envelope "To" "sent@crbclean.com"
{
  discard;
  stop;
} 

# FORWARD SENT EMAIL TO SENT@CRBCLEAN.COM
nano /etc/postfix/main.cf
always_bcc = sent@crbclean.com

