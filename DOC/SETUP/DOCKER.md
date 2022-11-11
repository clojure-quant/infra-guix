
https://linuxnatives.net/2019/align-user-ids-inside-and-outside-docker-with-subuser-mapping

 one will run into problems 
   if the UID of the host machine user 
   and the Docker image user do not match.


 /etc/docker/daemon.json



sudo adduser -u 2002 pink

