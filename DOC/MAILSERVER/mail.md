
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

