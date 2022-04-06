

## python

PYTHON env variable: if python3 is installed in host, this variable
fucks up local apps that use python. I only install python in dev 
profile. so should not be an issue. solution: unset python in bashrc
or wait for update (which comes soon)

it will complain with “Permission denied” because it is trying to install in the (immutable) Guix store. Override with

pip3 install --user package-name


