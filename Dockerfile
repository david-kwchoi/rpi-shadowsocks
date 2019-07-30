FROM balenalib/raspberrypi3:buster

LABEL version="1.0" owner="b1iz4rclavid"

RUN [ "cross-build-start" ]
RUN apt-get update -y && apt-get install -y shadowsocks-libev

RUN groupadd -g 999 shadowsocks &&  useradd -r -u 999 -g shadowsocks shadowsocks
RUN mkdir -p /home/shadowsocks && chown -R shadowsocks:shadowsocks /home/shadowsocks && chmod -R 777 /var/log
RUN [ "cross-build-end" ]

USER shadowsocks 

# Configure ss-server
ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8388
ENV PASSWORD=
ENV METHOD      aes-256-gcm
ENV TIMEOUT     300
ENV DNS_ADDRS   8.8.8.8,8.8.4.4
ENV ARGS=

EXPOSE $SERVER_PORT 

CMD exec ss-server \
      -s $SERVER_ADDR \
      -p $SERVER_PORT \
      -k ${PASSWORD:-$(hostname)} \
      -m $METHOD \
      -t $TIMEOUT \
      -d $DNS_ADDRS \
      -u \
      $ARGS
