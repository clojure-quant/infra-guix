
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
;;; Tyreunom's system administration and configuration tools.
;;;
;;; Copyright © 2019 Julien Lepiller <julien@lepiller.eu>
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation, either version 3 of the License, or
;;; (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;
;; Definition of rotation policies
;;
(define-module (config rotation)
  #:use-module (gnu services)
  #:use-module (gnu services admin)
  #:export (server-rotation-service-config
            desktop-rotation-service-config))
(define base-rotations
  (list
    (log-rotation
      ;; What about /var/log/guix?
      (files '("/var/log/guix-daemon.log"))
      (frequency 'daily)
      (options '("rotate 1" "log_rotate")))
    (log-rotation
      (files '("/var/log/mcron.log"))
      (frequency 'weekly)
      (options '("rotate 2" "log_rotate")))
    (log-rotation
      (files
        (map
          (lambda (<>) (string-append "/var/log/" <>))
          '("debug" "lastlog" "messages" "secure" "wtmp")))
      (frequency 'weekly)
      (options '("rotate 4" "log_rotate")))
    (log-rotation
      (files '("/var/log/shepherd.log"))
      (frequency 'daily)
      (options '("rotate 1" "log_rotate")))))
(define server-rotation-service-config
  (rottlog-configuration
    (rotations
      (append
        (list
          (log-rotation
            (files '("/var/log/letsencrypt/letsencrypt.log"))
            (frequency 'daily)
            (options '("rotate 30" "log_rotate" "nocompress")))
          (log-rotation
            (files '("/var/log/maillog"))
            (options '("rotate 5" "log_rotate"))
            (frequency 'daily))
          (log-rotation
            (files '("/var/log/nginx/access.log" "/var/log/nginx/error.log"))
            (frequency 'weekly)
            (options '("rotate 1" "log_rotate" "nocompress"))))
        base-rotations))))
(define desktop-rotation-service-config
  (rottlog-configuration
    (rotations base-rotations)))