#!/bin/bash
firewall-cmd --permanent --add-port=6443/tcp --zone=public
firewall-cmd --permanent --add-port=2379/tcp --zone=public
firewall-cmd --permanent --add-port=2380/tcp --zone=public
firewall-cmd --permanent --add-port=10250/tcp --zone=public
firewall-cmd --permanent --add-port=10251/tcp --zone=public
firewall-cmd --permanent --add-port=10252/tcp --zone=public
firewall-cmd --permanent --add-port=30000-32767/tcp --zone=public
# flannel
firewall-cmd --permanent --add-port=8472/udp --zone=public
firewall-cmd --permanent --add-masquerade --zone=public
# nfs
yum install nfs-utils -y
