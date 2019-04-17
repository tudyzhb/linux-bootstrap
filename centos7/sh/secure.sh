#!/bin/bash
sudo yum install yum-cron -y
sudo find /etc/yum/yum-cron.conf -type f -exec sed -i 's/^apply_updates\ =\ no/apply_updates\ =\ yes/g' {} \;
sudo find /etc/yum/yum-cron-hourly.conf -type f -exec sed -i 's/^update_cmd\ =\ default/update_cmd\ =\ minimal-security/g' {} \;
sudo find /etc/yum/yum-cron-hourly.conf -type f -exec sed -i 's/^download_updates\ =\ no/download_updates\ =\ yes/g' {} \;
sudo find /etc/yum/yum-cron-hourly.conf -type f -exec sed -i 's/^apply_updates\ =\ no/apply_updates\ =\ yes/g' {} \;
sudo systemctl start yum-cron.service
sudo systemctl restart yum-cron.service
sudo systemctl enable yum-cron
# ssh
sudo yum install fail2ban -y
sudo systemctl start fail2ban
sudo systemctl enable fail2ban
