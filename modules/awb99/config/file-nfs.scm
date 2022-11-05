




(gnu services nfs)


(nfs-configuration
 (exports
  '(("/export"
     "*(ro,insecure,no_subtree_check,crossmnt,fsid=0)"))))




