


; https://superuser.com/questions/1639692/how-to-set-sysctl-fs-notify-max-user-watches-in-guix-guix-system-error-servi/1639697#1639697

; https://guix.gnu.org/en/manual/devel/en/html_node/Miscellaneous-Services.html#Miscellaneous-Services
; The service type for sysctl, which modifies kernel parameters under /proc/sys/


(modify-services %desktop-services
(sysctl-service-type config =>
  (sysctl-configuration
    (settings (append '(("fs.file-max" . "500000")
                        ("fs.inotify.max_user_watches" . "524288"))
                       %default-sysctl-settings)))))

)

(service sysctl-service-type
(sysctl-configuration
 (settings '(("fs.inotify.max_user_watches" . "100000")
             ("net.core.default_qdisc" . "fq")
             ("net.ipv4.tcp_congestion_control" . "bbr")))))))


            