# pinkgorilla profile

Docker-Image with R, Python, Clojure with pinkgorilla
build with guix

# Forums
https://www.reddit.com/r/GUIX?utm_medium=android_app&utm_source=share
https://t.me/gnuguix
IRC: #guix #guix-hpc 

# Data science
Interesting data-science links:
https://elephly.net/posts/2015-04-17-gnu-guix.html. guix in clusters
https://hpc.guix.info/blog/2019/10/towards-reproducible-jupyter-notebooks/ reproduceable jupiter notebooks
https://hpc.guix.info/ 
https://hpc.guix.info/blog/2021/01/guix-jupyter-0.2.1-released/
https://hpc.guix.info/blog/2020/07/reproducible-research-hackathon-experience-report/
https://gitlab.com/pjotrp/guix-notes/-/blob/master/R.org
https://elephly.net/posts/2017-03-24-r-with-guix.html

# Pinkgorilla
´´´
./docker-build.sh
./docker-run-interactive.sh
´´´

# guest-side services

shepherd syncthing works, but mcron does not.

## In host

guix environment --container -m flo.scm 

guix environment --container -m flo.scm  I use this
       guix environment --container -m flo.scm  --network -- df
       guix environment -m ./flo.scm
 
## Inside container
shepherd --config=scm/shepherd.scm
shepherd --config=scm/shepherd.scm   this loads all services in services folder
         shepherd --config=syncthing.scm           this loads only syncthing services
herd status
herd start apache
herd status apache
https://guix.gnu.org/blog/2020/gnu-shepherd-user-services/