#!/bin/bash
#yum install fail2ban
grep "Failed password for root" /var/log/secure | awk '{print $11}' | sort | uniq -c | sort -nr | head -n 30
