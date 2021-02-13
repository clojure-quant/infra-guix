#/bin/bash

# docker list-images

# echo "NODE_ENV: " ${NODE_ENV}

# no session variable - no connect
rm -f artefacts/pinkgorilla-session

echo "running docker-pinkgorilla"

docker run \
       -d \
       --privileged \
       -p 7070:7070 \
       --net "host" \
       -e NODE_ENV=${NODE_ENV} \
       -e USER=alice \
       -t -i pinkgorilla:latest \
       /run/current-system/profile/bin/bash \
       --login \
       > artefacts/pinkgorilla-session

echo "running docker-pinkgorilla done."

#      -u alice \
#       /bin/bash

# --env-file=<file-with-env-vars> 
#enffile:
# PATH=/root/.conda/envs/default-env/sbin:/root/.conda/envs/default-env/bin:/opt/gnu/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#PYTHONPATH=/gnu/store/f2dr9xbimg93pljm7xgmqb4cm5bxy98r-conda-4.3.16/lib/python3.5/site-packages:/gnu/store/f2dr9xbimg93pljm7xgmqb4cm5bxy98r-conda-4.3.16/lib/python3.5/site-packages/:/gnu/store/v4wnif7v5ack57n37l7zijyz1ypz2mk2-python-ruamel.yaml-0.15.19/lib/python3.5/site-packages:/gnu/store/h8cwxpf12hmh07i7ka5gpq0m33phvy9x-python-requests-2.13.0/lib/python3.5/site-packages:/gnu/store/csycdif77kigf1357rb8iyisfmgmbi7g-python-pycosat-0.6.1/lib/python3.5/site-packages:/gnu/store/6vcj52bgzl2ixxavnkfjg1rshrdmz7am-python-pytest-2.7.3/lib/python3.5/site-packages:/gnu/store/aqyli9n8kw1llj3jl7bc72rcfh6y9q9l-python-responses-0.5.1/lib/python3.5/site-packages:/gnu/store/9wnd5mvjlhxgll96mj3lk6iydplz51an-python-pyyaml-3.12/lib/python3.5/site-packages:/gnu/store/fk5s5mzyy5j232zk1lmxjvrbw5d8dimg-python-anaconda-client-1.6.3/lib/python3.5/site-packages:/gnu/store/yd655bpcqrzch4ai1dhs7v39yhm70mdi-python-3.5.3/lib/python3.5/site-packages:/gnu/store/s7n625jx3zd4ia2sabfc4kxwzkgx9n17-python-py-1.4.32/lib/python3.5/site-packages:/gnu/store/p3rakgmppp6gcb8309x0gz620bwspjny-python-six-1.10.0/lib/python3.5/site-packages:/gnu/store/i21rkc152mvfng27jscqsdy7s0ck4fl6-python-cookies-2.2.1/lib/python3.5/site-packages:/gnu/store/2w5zriglajmhlkyi99x9wbvq8v0j32af-python-clyent-1.2.1/lib/python3.5/site-packages

# docker exec -ti $container_id /run/current-system/profile/bin/bash --login
# docker run --privileged -d -e GUIX_NEW_SYSTEM=/var/guix/profiles/system 
# --net host --entrypoint /var/guix/profiles/system/profile/bin/guile 
# dcaa8fb677c7 /var/guix/profiles/system/boot

# docker exec -it  fb06fdcd3a0d /run/current-system/profile/bin/bash --login