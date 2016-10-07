#!/bin/bash
docker stop phpmyadmin
docker rm phpmyadmin
docker run -d \
--name phpmyadmin \
--link mariadb:db \
-p 8080:80 \
phpmyadmin/phpmyadmin
#--restart=always \
