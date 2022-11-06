

; https://guix.gnu.org/en/manual/devel/en/html_node/Miscellaneous-Services.html#Miscellaneous-Services

fail2ban scans log files (e.g. /var/log/apache/error_log) 
and bans IP addresses that show malicious signs – repeated password 
failures, attempts to make use of exploits, etc.

(append
(list
 (service fail2ban-service-type
          (fail2ban-configuration
           (extra-jails
            (list
             (fail2ban-jail-configuration
              (name "sshd")
              (enabled? #t))))))
 ;; There is no implicit dependency on an actual SSH
 ;; service, so you need to provide one.
 (service openssh-service-type))
%base-services)