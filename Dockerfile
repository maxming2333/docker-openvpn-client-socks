# OpenVPN client + SOCKS proxy
# Usage:
# Create configuration (.ovpn), mount it in a volume
# docker run --volume=something.ovpn:/ovpn.conf:ro --device=/dev/net/tun --cap-add=NET_ADMIN
# Connect to (container):1080
# Note that the config must have embedded certs
# See `start` in same repo for more ideas

FROM alpine:latest

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add --no-cache bash curl wget bind-tools openvpn openresolv openrc openssl shadowsocks-libev \
    && rm -rf /var/cache/apk/*

COPY entrypoint.sh /usr/local/bin/
COPY sockd.sh /usr/local/bin/

RUN chmod a+x /usr/local/bin/entrypoint.sh \
    && chmod a+x /usr/local/bin/sockd.sh

ENTRYPOINT  [ "entrypoint.sh" ]
