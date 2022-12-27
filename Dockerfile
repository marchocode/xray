# Reference URL:
# https://github.com/XTLS/Xray-core
# https://github.com/v2fly/v2ray-core
# https://github.com/Loyalsoldier/v2ray-rules-dat

FROM alpine:latest
LABEL maintainer="github/marchocode"

WORKDIR /root

COPY start.sh /root/start.sh
COPY xray.sh /root/xray.sh
COPY update-rules-dat.sh /etc/xray/update-rules-dat.sh
COPY config.json /etc/xray/config.json

RUN set -ex \
	&& apk add --no-cache tzdata ca-certificates \
	&& mkdir -p /var/log/xray /usr/share/xray \
	&& chmod +x /root/xray.sh \
	&& /root/xray.sh \
	&& rm -fv /root/xray.sh \
	&& wget -qO /usr/share/xray/geosite.dat https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat \
	&& wget -qO /usr/share/xray/geoip.dat https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat

VOLUME /etc/xray
ENV TZ=Asia/Shanghai
CMD [ "./start.sh" ]
