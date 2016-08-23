#!/bin/bash
docker stop mysql
docker rm mysql
docker run -d \
--restart=always \
--name mysql \
-p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=sergtsop \
-v /data/docker/con/mysql/data:/var/lib/mysql \
-v /etc/localtime:/etc/localtime:ro \
mysql:latest
