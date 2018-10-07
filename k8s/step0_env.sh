#!/bin/bash
# proxy
curl https://copr.fedorainfracloud.org/coprs/librehat/shadowsocks/repo/epel-7/librehat-shadowsocks-epel-7.repo -o /etc/yum.repos.d/librehat-shadowsocks-epel-7.repo
yum install -y epel-release
yum install -y supervisor.noarch
yum install -y shadowsocks-libev
cat <<EOF > /etc/supervisord.d/ss_local.ini
[program:ss_local]
command=/usr/bin/ss-local -s 0.0.0.0 -p 443 -k yourkey -m bf-cfb -b 127.0.0.1 -l 1080
autostart=true
autorestart=true
startretries=10
user=root
redirect_stderr=true
stdout_logfile=/tmp/ss_local.log
stdout_logfile_maxbytes=5MB
stdout_logfile_backups=5
EOF
yum install -y privoxy
cat <<EOF >> /etc/privoxy/config
forward-socks5   /               127.0.0.1:1080 .
EOF
mkdir -p /etc/systemd/system/docker.service.d
cat <<EOF >> /etc/systemd/system/docker.service.d/proxy.conf
[Service]
Environment="HTTP_PROXY=http://127.0.0.1:8118/" "HTTPS_PROXY=http://127.0.0.1:8118/" "NO_PROXY=localhost,127.0.0.1,.docker.io,.docker.com,.docker-cn.com"
EOF
systemctl daemon-reload
systemctl restart docker.service
systemctl enable supervisord && systemctl start supervisord
systemctl enable privoxy && systemctl start privoxy
# firwall-cmd
firewall-cmd --add-port=6443/tcp --permanent
firewall-cmd --add-port=2379/tcp --permanent
firewall-cmd --add-port=2380/tcp --permanent
firewall-cmd --add-port=10250/tcp --permanent
firewall-cmd --add-port=10251/tcp --permanent
firewall-cmd --add-port=10252/tcp --permanent
firewall-cmd --reload
# selinux
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config
# bridge
cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system
