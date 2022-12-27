#!/bin/sh

# refer https://github.com/Loyalsoldier/v2ray-rules-dat
# author https://github.com/marchocode

echo "update start..."

wget -qO /usr/share/xray/geoip.dat https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat

wget -qO /usr/share/xray/geosite.dat https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat

echo "update end..."
