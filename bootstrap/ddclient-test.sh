#/bin/sh

# check that MYVAULT environment variable is set.
if [ -z $MYVAULT ] ; then
  echo "MYVAULT environment variable not set. exiting" 
  exit -4
fi
echo "VAULT LOCATION: $MYVAULT"

# machine=$1
cfile=$MYVAULT/ddclient/nuc-ddclient.conf
echo "ddclient with config:  $cfile" 

ddclient -foreground \
-file $cfile