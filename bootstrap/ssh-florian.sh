#/bin/sh

machine=$1
ifile=$MYVAULT/ssh/flo2022
echo "ssh florian@$machine with identity file: $ifile" 

ssh florian@$machine -i $ifile