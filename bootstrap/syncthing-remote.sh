#/bin/sh

# check that MYVAULT environment variable is set.
if [ -z $MYVAULT ] ; then
  echo "MYVAULT environment variable not set. exiting" 
  exit -4
fi
echo "VAULT LOCATION: $MYVAULT"

machine=$1
ifile=$MYVAULT/ssh/flo2022
echo "ssh florian@$machine with identity file: $ifile" 

echo "opening remote syncthing in web browser"
xdg-open http://localhost:18384

echo "starting tunnel to remote synthing on ip: $machine"
ssh -N -L 18384:127.0.0.1:8384 florian@$machine -i $ifile


