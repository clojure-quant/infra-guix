# build systems

https://guix.gnu.org/manual/en/html_node/Build-Systems.html

## maven / java
https://maven.apache.org/configure.html
 -Xmx2048m -Xms1024m -XX:MaxPermSize=512m -Djava.awt.headless=true
 <maven.compiler.source>1.7</maven.compiler.source>


## ant-build-system java
  adds: ant
        Java Development Kit (JDK) 
   as provided by the icedtea package to the set of inputs. 
  Different packages can be specified with the #:ant and #:jdk parameters, respectively.

## clojure-build-system
  extension of ant-build-system, 
  Different packages can be specified with the 
       #:clojure
       #:jdk
       #:zip
       #:aot-include
       #:aot-exclude
       #:omit-source?
       #%main-class
 
    You can override the maven-build-system  default jdk and maven packages with the  
    #:jdk
    #:maven.


# python-build-system
   http://guix-website-test.cbaines.net/en/packages/python-pip-20.0.2/
   https://yhetil.org/guix-user/1701167f4c3.e4e64c8a25038.4576513321829582679@zoho.com/T/


# r-build-system
    https://www.bioconductor.org/
    Bioconductor uses the R statistical programming language

# node-build-system
    Which Node.js package is used to interpret the npm commands can be 
    specified with the #:node parameter which defaults to node.


    https://github.com/leibniz-psychology/psychnotebook-deploy/blob/master/src/zpid/machines/yamunanagar/cron.scm

    https://github.com/leibniz-psychology/psychnotebook-deploy/blob/master/src/zpid/machines/yamunanagar/ci.scm
