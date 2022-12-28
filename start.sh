#!/bin/sh

crond -L /var/log/syslog

/usr/bin/xray -config /etc/xray/config.json
