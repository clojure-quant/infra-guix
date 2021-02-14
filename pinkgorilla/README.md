# pinkgorilla profile

Docker-Image with R, Python, Clojure with pinkgorilla
build with guix

# Forums
https://www.reddit.com/r/GUIX?utm_medium=android_app&utm_source=share
https://t.me/gnuguix
IRC: #guix #guix-hpc 
mailing list: https://lists.gnu.org/archive/html/guix-science/

# Data science
Interesting data-science links:
https://elephly.net/posts/2015-04-17-gnu-guix.html. guix in clusters
https://hpc.guix.info/blog/2019/10/towards-reproducible-jupyter-notebooks/ reproduceable jupiter notebooks
https://hpc.guix.info/ 
https://hpc.guix.info/blog/2021/01/guix-jupyter-0.2.1-released/
https://hpc.guix.info/blog/2020/07/reproducible-research-hackathon-experience-report/
https://gitlab.com/pjotrp/guix-notes/-/blob/master/R.org
https://elephly.net/posts/2017-03-24-r-with-guix.html
https://hpc.guix.info/blog/2021/02/guix-hpc-activity-report-2020/
https://gitlab.inria.fr/guix-hpc/guix-kernel/-/blob/master/guix/jupyter/containers.scm
https://news.ycombinator.com/item?id=14400697


The Guix Workflow Language (or GWL) is a scientific computing extension to GNU Guix's declarative language for package management. It allows for the declaration of scientific workflows, which will always run in reproducible environments that GNU Guix automatically prepare


# Pinkgorilla
´´´
./docker-build.sh
./docker-run.sh
./docker-exec.sh
./docker-stop.sh
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


# module tuning:
guix build --with-input=guile=guile@2.0 guix

https://guix.gnu.org/manual/en/html_node/Package-Transformation-Options.html

https://guix.gnu.org/manual/en/html_node/Derivations.html



maven:
https://maven.apache.org/configure.html
 -Xmx2048m -Xms1024m -XX:MaxPermSize=512m -Djava.awt.headless=true
 <maven.compiler.source>1.7</maven.compiler.source>

https://guix.gnu.org/manual/en/html_node/Build-Systems.html
- ant-build-system java
  adds: ant
        Java Development Kit (JDK) 
   as provided by the icedtea package to the set of inputs. 
  Different packages can be specified with the #:ant and #:jdk parameters, respectively.
- clojure-build-system
  extension of ant-build-system, 
  Different packages can be specified with the 
       #:clojure
       #:jdk
       #:zip
       #:aot-include
       #:aot-exclude
       #:omit-source?
       #%main-class

- maven-build-system
    You can override the default jdk and maven packages with the  
    #:jdk
    #:maven.


- python-build-system
   http://guix-website-test.cbaines.net/en/packages/python-pip-20.0.2/
   https://yhetil.org/guix-user/1701167f4c3.e4e64c8a25038.4576513321829582679@zoho.com/T/


- r-build-system
    https://www.bioconductor.org/
    Bioconductor uses the R statistical programming language

- node-build-system
    Which Node.js package is used to interpret the npm commands can be 
    specified with the #:node parameter which defaults to node.


    https://github.com/leibniz-psychology/psychnotebook-deploy/blob/master/src/zpid/machines/yamunanagar/cron.scm

    https://github.com/leibniz-psychology/psychnotebook-deploy/blob/master/src/zpid/machines/yamunanagar/ci.scm


https://guix.gnu.org/manual/en/html_node/package-Reference.html

 let ((toolchain (specification->package "gcc-toolchain@10")))
  
  (package-with-c-toolchain 
     hello `(
               ("toolchain" ,toolchain)
            )))


(transform-package-toolchain replacement-specs)
list of strings like \"fftw=gcc-toolchain@10\"
