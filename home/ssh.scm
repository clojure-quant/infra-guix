(define-module (home-config ssh)
#:use-module (home)
#:use-module (home ssh)
#:export (known-hosts
          ssh-home))

(define known-hosts
(list
  (ssh-known-host-configuration
    (names '("192.168.1.68"))
    (key "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBGfAqcwAP7zdDpV6xEzvrClcW0rHa2AY6NNM/AOWPV8zU8nJ0x7XVpQWKhxfGVfa+EmGzmK1/h2/xBxSRBnB2FA="))
  (ssh-known-host-configuration
    (names '("bayfront.guixsd.org" "185.233.100.56"))
    (key "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKov4OZDoFlbD3DZtPl7O2LO1IuMdBdToMVOxpF1vkPBL7N7Q9VBz8Faq6KBWzHYriTwg2XEq667sgUxvHzTIJE="))
  (ssh-known-host-configuration
    (names '("framagit.org" "144.76.206.42"))
    (key "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBMwVAxRFizaWBgaKvpwwBJZumDqaxXuucDvFsYhPZXxoUmvGG/+dQB90vC4rJRzZn/cFN5USQCaEVTWZQzqHJGg="))
  (ssh-known-host-configuration
    (names '("git.savannah.gnu.org" "git.sv.gnu.org" "208.118.235.201" "209.51.188.201"))
    (key "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBP9c1Z2f4OHxymvLxqxQ/hY1g0ol0/iiXUrVFGZBBq4h5gD05c7Gw9rRrcrvF9XvumBvOghOQzDSZZLRWvFGocA="))
  (ssh-known-host-configuration
    (names '("github.com" "192.30.253.112" "192.30.253.113" "140.82.118.4"))
    (algo "ssh-rsa")
    (key "AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ=="))
  (ssh-known-host-configuration
    (names '("hermes.lepiller.eu" "lepiller.eu" "89.234.186.109"))
    (key "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBHwFjjb3LeA8S5P1SJE1Drn7KQgJSLNn3li7ChvF6POEfekix4PKkRFKpvFNKjDVvYLq9/p863Kk3d94dzxGJs4="))
  (ssh-known-host-configuration
    (names '("lfs.shaka.xyz]:2224" "[51.15.10.95]:2224"))
    (key "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBBRclTw3aigtukAmMH8AiijpSPMrgSVtVZpk+vFPudOKDdV/k4X43jvBQaGBmq8dTJzPwV15VsX2XwObmlr3JOg="))
  (ssh-known-host-configuration
    (names '("svn.linuxfromscratch.org" "192.155.86.174" "www.linuxfromscratch.org" "higgs.linuxfromscratch.org" "fr.linuxfromscratch.org"))
    (key "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBArm5Qu/vMLDKhrdIZ+5/jQOvr1J9ip08RY3Qkd7bDFTfMk1gbyJnCiQBncIK4iNjUF1OLiqJKMkTpLwv0bEvsc="))
  (ssh-known-host-configuration
    (names '("ftp.federez.net" "62.210.81.204"))
    (algo "ecdsa-sha2-nistp521")
    (key "AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBABzn68pwsOtQDzFEBsDo4U/k6N3YqWSK5ngEKMa9OVKqZEgnXyxVN8ew4r7o2Dp3yNx9FooWXDqTaeycaXjwNwkVQHOo4/Wj59d+7a8U0HOM+nogd2oqwAmMziN2mN39vncXVx+tiOnRXFS84JSsLJE68omMUyGbvYTvH+EsoRZaP+JQw=="))
  (ssh-known-host-configuration
    (names '("notabug.org" "176.9.32.93"))
    (key "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBK0PiD7FUF9Zo5YYh+dq7VY/zptvDPS9YjUq45jogxPLMq2b9zBgkfAVFrUTNjPsxh26jOWxI6OxxldUgse4CpY="))
  (ssh-known-host-configuration
    (names '("gitlab.com" "35.231.145.151"))
    (key "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFSMqzJeV9rUzU4kWitGjeR4PWSa29SPqJ1fVkhtj3Hw9xjLVXVYrU9QlYWrOLXBpQ6KWjbjTDTdDkoohFzgbEY="))
  (ssh-known-host-configuration
    (names '("ene.lepiller.eu" "rennes.lepiller.eu" "git.lepiller.eu" "79.91.200.80" "192.168.1.20"))
    (key "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBOhW/qorkJoTi2nvOxmDbaMlKsO6jTfj7FBB18Oj7tOBziJaDpgUNxyuRazEVOK0b/fdgzgBdzjSWfii+qwNzGI="))
  (ssh-known-host-configuration
    (names '("amadeus.lepiller.eu"))
    (algo "ssh-ed25519")
    (key "AAAAC3NzaC1lZDI1NTE5AAAAIGop3/fV85tD2UaaZP1/xAH1HqdRbU7xWAUNrZzejJdc"))
  (ssh-known-host-configuration
    (names '("xana.lepiller.eu" "62.210.81.154"))
    (key "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBLfqwykh/7mCxwJrt94BT/k4Afoos4n+DVSsEKTeBCORY9XM9Wo+/fSEjHTpUnmvd5dN8iIJ+bNBE1foo5P1GTM="))))

(define ssh-home
(user-home ssh-home-type
  (ssh-configuration
    (known-hosts known-hosts)
    (hosts
      (list
        (ssh-host-configuration
          (host-name "traduc.org")
          (name "traduc")
          (port "222")
          (user "julien"))))
    (default-host
      (ssh-host-configuration
        (identity-file "/data/tyreunom/.ssh/id_rsa"))))))
