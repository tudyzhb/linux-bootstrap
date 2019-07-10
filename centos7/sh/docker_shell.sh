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

# proxy
mkdir -p /etc/systemd/system/docker.service.d
sudo tee /etc/systemd/system/docker.service.d/proxy.conf <<-'EOF'
[Service]
Environment="HTTP_PROXY=http://127.0.0.1:8118/" "HTTPS_PROXY=http://127.0.0.1:8118/" "NO_PROXY=localhost,127.0.0.1,*.docker.io"
EOF
#systemctl show --property Environment docker

# start
systemctl enable docker.service
systemctl start docker.service
