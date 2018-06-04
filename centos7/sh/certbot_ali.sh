#!/bin/bash
pip uninstall requests
pip uninstall urllib3
yum remove python-urllib3
yum remove python-requests
yum install python-urllib3
yum install python-requests
yum install certbot
#
#yum -y install yum-utils
#yum-config-manager --enable rhui-REGION-rhel-server-extras rhui-REGION-rhel-server-optional
yum install python2-certbot-nginx
