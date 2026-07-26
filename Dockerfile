# Alpine Linux (stable)
FROM alpine:3.19

# Community repository जोड़ें और shadowsocks-libev इंस्टॉल करें
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.19/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/v3.19/community" >> /etc/apk/repositories && \
    apk add --no-cache \
        shadowsocks-libev \
        gettext \
        openssl \
    && rm -rf /var/cache/apk/*

# कॉन्फ़िगरेशन डायरेक्टरी
RUN mkdir -p /etc/shadowsocks-libev

# एंट्रीपॉइंट स्क्रिप्ट कॉपी करें
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8388

ENTRYPOINT ["/entrypoint.sh"]
