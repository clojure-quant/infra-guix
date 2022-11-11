docker

# for problems with docjer socket see:
# https://developer.fedoraproject.org/tools/docker/docker-installation.html

Installation
apt-get install docker-engine
Docker service
systemctl status docker.service 
systemctl start docker.service 

Pull docker-image from dockerhub
docker pull debian
docker pull ubuntu

Build from dockerfile
# need to be in a directory that has the a file called  Dockerfile
docker build -t jessie .  --no-cache=true


ps
docker ps
docker ps -a

run

docker run -t -i debian /bin/bash             (with CTRL D can exit)
docker run ubuntu /bin/bash	 	run ubuntu with bash shell; but this is not visible
docker run -i -t -p 8888:8888 jessie  /bin/bash  
docker run --name mydemo -it -d ubuntu

exec
Detach (run in background)
docker exec -d ubuntu_bash touch /tmp/execWorks
Bash into container (interactive tty)
docker exec -it  mydemo bash
docker exec -ti my_mail_1 tail -f /path/to/the/requested/file.log

attach
You can attach to the same contained process multiple times simultaneously
docker run -d --name topdemo ubuntu /usr/bin/top -b
docker attach topdemo
To detach the tty without exiting the shell, use the escape sequence Ctrl+p + Ctrl+q.



Docker Compose
Needs to be installed separately
https://docs.docker.com/compose/

Kubernetes
System how to manage multiple containers.
http://kubernetes.io/

Linux and docker service admin
http://cockpit-project.org/

Desktop in a docker container
https://blog.docker.com/2013/07/docker-desktop-your-desktop-over-ssh-running-inside-of-a-docker-container/

Dont use SSH into the container
https://blog.docker.com/2014/06/why-you-dont-need-to-run-sshd-in-docker/





