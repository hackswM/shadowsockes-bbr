FROM teddysun/shadowsocks-libev:alpine
# install rinetd
RUN apk update && apk add bash
COPY /config/rinetd_bbr /usr/bin
COPY /config/rinetd.conf /etc
COPY /config/config.json /etc/shadowsocks-libev/
RUN set -ex \
    # Install dependencies
    && apk add iptables \
    && chmod +x /usr/bin/rinetd_bbr

# install supervisor
RUN apk add supervisor \
    && mkdir -p /etc/supervisord.d
COPY /config/supervisord.conf /etc
COPY /config/process.conf /etc/supervisord.d
STOPSIGNAL SIGTERM
CMD ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
