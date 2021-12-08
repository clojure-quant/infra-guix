


(modify-services %desktop-services
(sysctl-service-type config =>
  (sysctl-configuration
    (settings (append '(("fs.file-max" . "500000")
                        ("fs.inotify.max_user_watches" . "524288"))
                       %default-sysctl-settings)))))

)
https://superuser.com/questions/1639692/how-to-set-sysctl-fs-notify-max-user-watches-in-guix-guix-system-error-servi/1639697#1639697


(service sysctl-service-type
(sysctl-configuration
 (settings '(("fs.inotify.max_user_watches" . "100000")
             ("net.core.default_qdisc" . "fq")
             ("net.ipv4.tcp_congestion_control" . "bbr")))))))


  