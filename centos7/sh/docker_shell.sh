#!/bin/bash
curl -fsSL https://get.docker.com/ | sh

# docker config
sudo mkdir /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://registry.docker-cn.com"],
  "data-root": "/data/docker/lib/docker/"
}
EOF
