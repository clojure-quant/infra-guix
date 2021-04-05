CACERTS="/home/andreas/.keystore"
cd /etc/ssl/certs
for file in *.crt; do
   echo "Importing $file..."
   openssl x509 -outform der -in "$file" -out /tmp/certificate.der
   keytool -import -alias "$file" -keystore $CACERTS \
           -file /tmp/certificate.der -deststorepass changeit -noprompt
done