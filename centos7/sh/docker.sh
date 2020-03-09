#!/bin/bash
curl -fsSL https://get.docker.com/ | sh

# prerequisites
yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

# repo
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum makecache fast

# install
yum install -y docker-ce

# selinux
mkdir -p /data
semanage fcontext -a -t var_t /data
restorecon -v /data

# docker config
sudo mkdir /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": [
    "https://dockerhub.azk8s.cn",
    "https://hub-mirror.c.163.com"
  ],
  "data-root": "/data/docker/lib/docker/"
}
EOF
