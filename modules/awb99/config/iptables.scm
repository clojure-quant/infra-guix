(define-module (awb99 config iptables)
  #:export (iptables-allow-8080
            iptables-port-redirect
            service-iptables))

(use-modules 
  (guix) ; plain-file
  (gnu services) ; service
  (gnu services networking) ; iptables config
)


(define iptables-allow-8080
"*filter
:INPUT ACCEPT
:FORWARD ACCEPT
:OUTPUT ACCEPT
-A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
-A INPUT -p tcp --dport 8080 -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-port-unreachable
COMMIT
")

;; https://unix.stackexchange.com/questions/419539/opening-all-ports-on-localhost-for-internal-communication

; this rule allows connections on localhost and 127.0.0.1. 
; this is important so we can use nrepl.
; port 80/443 are accepted from outside and are forwarded to 8080/8443
; this are the ports webly uses by default.

(define iptables-port-redirect
"*filter
:INPUT ACCEPT
:FORWARD ACCEPT
:OUTPUT ACCEPT
-A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
-A INPUT -p tcp -s localhost -j ACCEPT
-A INPUT -p tcp -s 127.0.0.1 -j ACCEPT
-I INPUT -i lo -j ACCEPT
-I OUTPUT -o lo -j ACCEPT
-A INPUT -p tcp --dport 22 -j ACCEPT
-A INPUT -p tcp --dport 8200 -j ACCEPT
-A INPUT -p tcp --dport 8080 -j ACCEPT
-A INPUT -p tcp --dport 8443 -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-port-unreachable
COMMIT
*nat
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
-A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 8443
COMMIT
")

; -A INPUT -p tcp --dport 80 -j ACCEPT
; -A INPUT -p tcp --dport 443 -j ACCEPT


; iptables -t nat -A PREROUTING -p tcp --dport 1020:1030 -j DNAT --to-destination IPADDR
;

; sudo iptables -I PREROUTING -t nat  -p tcp --dport 80 -j REDIRECT --to-port 8080
; sudo iptables -I INPUT -p tcp --dport 8080 -j ACCEPT

;-A INPUT -j REJECT --reject-with icmp-port-unreachable
; -i eno0

; sudo iptables-restore iptables.txt

(define example-rules 
"*filter
:INPUT DROP [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -i lo -j ACCEPT
-A INPUT -i wlp4s0 -p tcp -m tcp -s 10.1.3.0/24 --dport 2242 -j ACCEPT
-A INPUT -i wlp4s0 -p tcp -m tcp -s 10.1.3.0/24 --dport 8000:8099 -j ACCEPT
-A INPUT -i wwp0s20f0u6i12 -j DROP
-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
COMMIT
")

(define service-iptables
  (service iptables-service-type
    (iptables-configuration
      (ipv4-rules (plain-file "iptables.rules" 
        ;iptables-allow-8080 
        iptables-port-redirect
    )))))