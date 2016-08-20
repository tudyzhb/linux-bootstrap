#!/bin/bash
docker stop pg
docker rm pg
docker run -d \
--restart=always \
--name pg \
-p 5432:5432 \
-e POSTGRES_PASSWORD=sergtsop \
-v /data/docker/con/postgres/data:/var/lib/postgresql/data \
-v /etc/localtime:/etc/localtime:ro \
postgres:latest
