#!/bin/bash
curl -fsSL https://get.docker.com/ | sh

# docker config
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://registry.docker-cn.com"]
}
EOF
