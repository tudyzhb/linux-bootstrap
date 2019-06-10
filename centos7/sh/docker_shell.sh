#!/bin/bash
curl -fsSL https://get.docker.com/ | sh

# selinux
mkdir -p /data
semanage fcontext -a -t var_t /data
restorecon -v /data

# docker config
sudo mkdir /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://registry.docker-cn.com"],
  "data-root": "/data/docker/lib/docker/"
}
EOF

# start
systemctl enable docker.service
systemctl start docker.service
