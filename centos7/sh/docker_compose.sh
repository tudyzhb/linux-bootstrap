#!/bin/bash
sudo yum install epel-release
sudo yum install -y python-pip
sudo pip install docker-compose

# binary
curl https://github.com/docker/compose/releases/download/1.28.5/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose
