
# guest-side services

shepherd syncthing works, but mcron does not.

## In host

guix environment --container -m flo.scm 

guix environment --container -m flo.scm  I use this
       guix environment --container -m flo.scm  --network -- df
       guix environment -m ./flo.scm
 
## Inside container
shepherd --config=scm/shepherd.scm
shepherd --config=scm/shepherd.scm   this loads all services in services folder
         shepherd --config=syncthing.scm           this loads only syncthing services
herd status
herd start apache
herd status apache
https://guix.gnu.org/blog/2020/gnu-shepherd-user-services/


