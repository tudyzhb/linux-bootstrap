#!/bin/bash
sudo easy_install supervisor
sudo echo_supervisord_conf > /etc/supervisord.conf
sudo sed -i -- 's/minfds=1024/minfds=65535/g' /etc/supervisord.conf
sudo echo "[include]" >> /etc/supervisord.conf
sudo echo "files = supervisord.d/*.ini" >> /etc/supervisord.conf
sudo tee /usr/lib/systemd/system/supervisord.service <<-'EOF'
[Unit]
Description=Process Monitoring and Control Daemon
After=rc-local.service

[Service]
Type=forking
ExecStart=/usr/bin/supervisord -c /etc/supervisord.conf
SysVStartPriority=99

[Install]
WantedBy=multi-user.target
EOF

systemctl enable supervisord.service
systemctl start supervisord.service
