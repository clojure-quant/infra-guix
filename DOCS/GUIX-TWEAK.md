# create custom package

https://guix.gnu.org/manual/en/html_node/package-Reference.html
https://medium.com/swlh/guix-packaging-by-example-6e44ba693fb2
Make your own package:
https://gitlab.com/pjotrp/guix-notes/-/blob/master/GUIX-SIMPLE-PACKAGE.org


## modify package definition

https://guix.gnu.org/manual/en/html_node/Package-Transformation-Options.html
https://guix.gnu.org/manual/en/html_node/Derivations.html
https://guix.gnu.org/en/blog/2018/customize-guixsd-use-stock-ssh-agent-everywhere/
https://guix.gnu.org/en/blog/2019/qa-on-non-intel-at-guix-days/

see scm/gorilla/tweak-node.scm

## cli tweaks

guix build --with-input=guile=guile@2.0 guix

This is a recursive, deep replacement. So in this example, both guix and its dependency guile-json (which also depends on guile) get rebuilt against guile@2.0.

This is implemented using the package-input-rewriting Scheme procedure (see package-input-rewriting). 
guix build --with-input=guile=guile@2.0 guix






 let ((toolchain (specification->package "gcc-toolchain@10")))
  
  (package-with-c-toolchain 
     hello `(
               ("toolchain" ,toolchain)
            )))


(transform-package-toolchain replacement-specs)
list of strings like \"fftw=gcc-toolchain@10\"


Florian Hoertlehner, [14.02.21 14:25]
11:05 AM <ngz> yoctocell: #f not f

Florian Hoertlehner, [14.02.21 14:25]
11:05 AM <ngz> #f (or #false) and #t (or #true) are the booleans
11:20 AM <ngz> guix archive --authorize < PREFIX/share/guix/ci.guix.gnu.org.pub per manual
