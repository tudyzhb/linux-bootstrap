#!/bin/bash

# nginx
sudo tee /etc/yum.repos.d/nginx.repo <<-'EOF'
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/x86_64/
gpgcheck=0
enabled=1
EOF
sudo yum update
sudo yum install -y nginx
# ws-proxy
echo "nginx soft nofile 4096" > /etc/security/limits.d/nginx.conf
echo "nginx hard nofile 65535" >> /etc/security/limits.d/nginx.conf
# proxy
semanage port -a -t http_port_t -p tcp 8080
setsebool httpd_can_network_connect 1 -P
# limit https://plone.lucidsolutions.co.nz/web/reverseproxyandcache/increase-nginx-file-limits
mkdir -p /lib/systemd/system/nginx.service.d
sudo tee /lib/systemd/system/nginx.service.d/worker_files_limit.conf <<-'EOF'
[Service]
LimitNOFILE=100000
EOF
