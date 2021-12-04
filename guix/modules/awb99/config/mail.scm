(define-module (awb99 config mail)
#:use-module (gnu packages mail)
#:use-module (gnu services)
#:use-module (gnu services mail)
#:use-module (guix gexp)
#:use-module (awb99 services mail)
#:export (lepiller-mail-services))


(define aliases-file
(plain-file "aliases" "postmaster root

@ tyreunom
"))


(define hermes-ip4 "89.234.186.109")
 (define hermes-ip6 "2a00:5884:8208::1")
 (define ene-ip4 "79.91.200.80")
 (define xana-ip4 "62.210.81.154")

(define relays-file
(plain-file "other-relays"
  (string-append ene-ip4 "\n" hermes-ip4 "\n" hermes-ip6 "\n" )))

(define blacklist-file
(plain-file "blacklist" "
@yahoo.com.cn
@qq.com
@fnac.com
@just-aero.us
@elitetorrent1.com"))

(define (opensmtpd-conf interface domain)
(mixed-text-file "smtpd.conf" "
# This is the smtpd server system-wide configuration file.
# See smtpd.conf(5) for more information.

# My TLS certificate and key
pki lepiller.eu cert \"/etc/letsencrypt/live/" domain "/fullchain.pem\"
pki lepiller.eu key \"/etc/letsencrypt/live/" domain "/privkey.pem\"

# Edit this file to add more virtual users (passwords are read in that file
# instead of /etc/passwd.
# table passwd file:/etc/mail/passwd
table passwd file:/etc/passwd

table other-relays file:" relays-file "
table blacklist file:" blacklist-file "

# A simple spam filter
filter spam-filter phase mail-from match mail-from <blacklist> reject \"555 Your spam level is over NINE THOUSAND!\"

# port 25 is used only for receiving from external servers, and they may start a
# TLS session if the want.
listen on " interface " port 25 tls pki lepiller.eu filter spam-filter
# For sending messages from outside of this server, you need to authenticate and
# use TLS.
listen on " interface " port 587 tls-require pki lepiller.eu mask-src auth <passwd>
# Localhost is used by the .onion, so we use the same configuration for
# local connections.
listen on lo port 25 tls pki lepiller.eu filter spam-filter
# Since incoming connection uses tor, we don't need tls, but still require
# authentication; we're not a relay
listen on lo port 587 tls pki lepiller.eu mask-src auth <passwd>

# DKIMproxy
listen on lo port 10028 tag DKIM_OUT

# The socket is considered an internal connection
listen on socket mask-src

# Maybe it'll work better if we connect to gmail only with v4?
#limit mta for domain gmail.com inet4

# TODO: manage these files directly in the configuration?
# If you edit the file, you have to run \"smtpctl update table aliases\"
table aliases file:" aliases-file "

# We define some actions
action receive maildir virtual <aliases>
action outbound relay
action godkim relay host smtp://127.0.0.1:10027

# We accept to relay any mail from authenticated users
match for any from any auth action godkim
match tag DKIM_OUT for any action outbound

# Then, we reject on some other conditions:

# If the mail tries to impersonate us
match !from src <other-relays> mail-from \"@lepiller.eu\" for any reject
# If it comes from someone on the blacklist
match from any mail-from <blacklist> reject

# Finaly, if we accept incoming messages
match from any for domain \"lepiller.eu\" action receive
match for local action receive
"))


(define (lepiller-smtp-service interface domain)
(service opensmtpd-service-type
         (opensmtpd-configuration
           (config-file (opensmtpd-conf interface domain)))))

(define (lepiller-imap-service domain)
  (service dovecot-service-type
           (dovecot-configuration
             (mail-location "maildir:~/Maildir")
             (ssl-cert (string-append
                         "</etc/letsencrypt/live/" domain "/fullchain.pem"))
             (ssl-key  (string-append
                         "</etc/letsencrypt/live/" domain "/privkey.pem")))))

  

(define (lepiller-dkim-service domain)
  (service dkimproxy-out-service-type
           (dkimproxy-out-configuration
             (listen "127.0.0.1:10027")
             (relay "127.0.0.1:10028")
             (sender-map
               `((,domain
                  (,(dkimproxy-out-signature-configuration
                      (type 'dkim)
                      (key "/etc/mail/dkim/private.key")
                      (algorithm "rsa-sha256")
                      (method "relaxed")
                      (selector "dkim"))
                   ,(dkimproxy-out-signature-configuration
                      (type 'domainkeys)
                      (method "nofws")))))))))

(define* (lepiller-mail-services #:key interface domain)
  (list
    (lepiller-smtp-service interface domain)
    ; (lepiller-imap-service domain)
    ; (lepiller-dkim-service domain)
  ))
                        



