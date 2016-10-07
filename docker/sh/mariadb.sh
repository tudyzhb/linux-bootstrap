#!/bin/bash
docker stop mariadb
docker rm mariadb
docker run -d \
--restart=always \
--name mariadb \
-p 6034:3306 \
-e MYSQL_ROOT_PASSWORD=pqowieurytghdjkal98537219 \
-v /data/docker/con/mariadb/data:/var/lib/mysql \
-v /etc/localtime:/etc/localtime:ro \
mariadb:latest \
--character-set-server=utf8mb4 \
--collation-server=utf8mb4_unicode_ci \
