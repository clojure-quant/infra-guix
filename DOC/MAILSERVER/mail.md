
https://github.com/forteco/myMail

My repository configures docker-mailserver.
https://github.com/tomav/docker-mailserver/blob/master/README.md



/usr/local/myMail

mail.allineedtea.com
 	IMAP Port 993 with SSL/TLS
 	SMTP port 587 with STARTTLS

Pop3 ports are not open by default.



WHAT TO DO AT OMNIS
Add MX server
Add the DKIM key, and add it in OMNIS. 

WHAT TO DO AT SCALEWAY
REMOVE SMTP BLOCKING (security group)
Add PTR (which points from the IP address to the domain name)



WHAT TO DO IN THE IMAGE
Add debian test repository
Apt-get install docker.io docker-compose
Add github/myMAIL

guix packages: 
- exim
- dkimproxy (designed for postfix, but works with others)
- dovecot

IMAP over SSL via Dovecot, complete with full text search provided by Solr.
POP3 over SSL, also via Dovecot
SMTP over SSL via Postfix, including a nice set of DNSBLs to discard spam before it ever hits your filters.
Spam fighting via Rspamd.

Mail server verification using DKIM and DMARC so the Internet knows your mailserver is legit.

