
https://giters.com/nn1ks/vaultwarden


                  ;; Bitwarden
                  ;; https://github.com/dani-garcia/vaultwarden/wiki/Proxy-examples
                  (nginx-server-configuration
                    (server-name '("vault.n1ks.net"))
                    (listen '("443 ssl" "[::]:443 ssl"))
                    (ssl-certificate "/etc/letsencrypt/live/vault.n1ks.net/fullchain.pem")
                    (ssl-certificate-key "/etc/letsencrypt/live/vault.n1ks.net/privkey.pem")
                    (locations
                      (list
                        (nginx-location-configuration
                          (uri "/")
                          (body '("proxy_pass http://localhost:8081;"
                                  "proxy_set_header Host $host;"
                                  "proxy_set_header X-Real-IP $remote_addr;"
                                  "proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;"
                                  "proxy_set_header X-Forwarded-Proto $scheme;")))
                        (nginx-location-configuration
                          (uri "/notifications/hub")
                          (body '("proxy_pass http://localhost:8082;"
                                  "proxy_set_header Upgrade $http_upgrade;"
                                  "proxy_set_header Connection \"upgrade\";")))
                        (nginx-location-configuration
                          (uri "/notifications/hub/negotiate")
                          (body '("proxy_pass http://localhost:8081;")))))
                    (raw-content '("client_max_body_size 128M;")))
