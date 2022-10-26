# Packages

For package management, do note that there is a crucial difference between the user and the system profile. 
Because you do not want to clog yourself with many big packages during a guix system reconfigure, you want only the 
crucial ones in the system profile.


https://guix.gnu.org/de/packages

The exact installed version depends on the version-hash of the channel.
A manifest is a scm file that can be installed with one click. From a profile the manifest can be extracted.

; or this: package reprocessing
; https://github.com/alezost/guix-config/blob/master/modules/al/guix/utils.scm



;https://unix.stackexchange.com/questions/621269/use-a-python-projects-requirements-txt-as-input-to-a-guix-package-definition?rq=1


install old packages:
https://librehacker.com/2021/06/01/guix-manifests-package-outputs-and-inferiors/

´´´
info
guix search xxx
guix package --list-installed
guix package --list-profiles
guix package --search-paths. List recommended environment variables
guix show trezord   ; see description of package trezord
guix edit trezord   ; see source code of package trezord
guix package --show=p7zip   ; guix show is an alias for this



guix build trezord-udev-rules   ; show the directory where a package got installed to.

update
guix pull
guix upgrade

install

guix install xxx
guix remove xxx

manifest
guix package --export-manifest     → this can be saved in git repo.
guix package --manifest=flo.scm       -> import packages from manifest

Example manifest:
(specifications->manifest '("emacs" "frozen-bubble" "git"))

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


guix archive --authorize < PREFIX/share/guix/ci.guix.gnu.org.pub per manual

LEARN PACKAGES:
https://ambrevar.xyz/guix-packaging/index.html


# profiles

Goal: create byte identical profiles over time that are not only shared between machines 
(important for deployment) but also between developers. 
Development, testing, staging, production - essentially these are all profiles!

guix package -i sambamba -p ~/opt/sambamba
Guix provides a profile file which contains the necessary shell settings into the environment
cat ~/opt/sambamba/etc/profile


For trying things out, I recommend using `guix environment --ad-hoc foo`
That way, your profile history does not contain the thing that you just wanted to try out, so `guix gc` can work more efficiently

https://rednosehacker.com/taking-baby-steps-with-guix-2-more-profiles
guix package --list-profiles





export GUIX_PROFILE="/home/florian/.guix-extra-profiles/cli/cli"
bash $GUIX_PROFILE/etc/profile