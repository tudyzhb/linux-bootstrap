#!/bin/bash

# prerequisites
yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

# repo
# https://download.docker.com/linux/centos/docker-ce.repo
yum-config-manager \
    --add-repo \
    http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum makecache fast

# install
yum install -y docker-ce

# selinux
mkdir -p /data
semanage fcontext -a -t var_t /data
restorecon -v /data

# docker config
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo mkdir /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2",
  "storage-opts": [
    "overlay2.override_kernel_check=true"
  ],
  "registry-mirrors": [
    "https://dockerhub.azk8s.cn",
    "https://hub-mirror.c.163.com"
  ],
  "data-root": "/data/docker/lib/docker/"
}
EOF
