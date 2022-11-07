orts
protocol
service
unsecure
secure
smtp
postfix
25 (100% text)
587 TLS
465
Imap
courier
143
993
pop


110
995


smtp
If your computer was on and connected to the network all the time, you could use SMTP to receive messages to your machine. However, as your computer can be turned off or disconnected, the most common pattern is that you ask your email server to keep messages for you, and read them later on using POP/IMAP.

dkim
http://www.dkim.org/specs/rfc4871-dkimbase.html

SASL
http://www.postfix.org/SASL_README.html
SMTP servers need to decide whether an SMTP client is authorized to send mail to remote destinations, or only to destinations that the server itself is responsible for. Usually, SMTP servers accept mail to remote destinations when the client's IP address is in the "same network" as the server's IP address.
SMTP clients outside the SMTP server's network need a different way to get "same network" privileges. To address this need, Postfix supports SASL authentication (RFC 4954, formerly RFC 2554). With this a remote SMTP client can authenticate to the Postfix SMTP server, and the Postfix SMTP client can authenticate to a remote SMTP server. Once a client is authenticated, a server can give it "same network" privileges.



TESTING

 Ports test SMTP/IMAP:
telnet localhost 25 			test of SMTP
Then enter:  ehlo localhost
telnet localhost 143 			test of IMAP
nmap mail.allineedtea.com


REVERSE POINTER CHECK
dig mail.allineedtea.com
dig -x 51.15.67.142
THIS NEEDS TO BE DONE AFTER THE PTR HAS BEEN SET AT SCALEWAY.


DKIM
www.dkimvalidator.com


CERTIFICATE CHECK
https://www.checktls.com/TestReceiver 


blacklist check + Smtp Banner Check
https://mxtoolbox.com/SuperTool.aspx   


http://www.dnsstuff.com runs many tests (including postmaster and abuse)

	 If you want to double-check that your system is configured correctly, here are some tools:

DNS: pingability.com/zoneinfo
DKIM and SPF: dkimvalidator.com
SSL: ssllabs.com

Linux

hostname             (query hostname)
hostname -b backoffice.newstrading.org 

dig +short MX newstrading.org                (list mailserver for domain)

mail
mail    (shows mailbox of user)
echo "body3" | mail -s "subject3" hoertlehner@gmail.com
sudo nano /etc/aliases


