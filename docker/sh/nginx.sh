#!/bin/bash
docker stop nginx
docker rm nginx
docker run --restart=always -d \
--name nginx \
-p 80:80 \
-p 443:443 \
-v /data/docker/con/nginx/nginx.conf:/etc/nginx/nginx.conf:ro \
-v /data/docker/con/nginx/conf.d:/etc/nginx/conf.d:ro \
-v /data/docker/con/nginx/www:/var/www/html:ro \
-v /data/docker/con/nginx/log:/var/log/nginx:rw \
nginx:stable
