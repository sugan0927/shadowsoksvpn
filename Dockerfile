# Alpine Linux पर आधारित हल्का इमेज
FROM alpine:latest

# आवश्यक पैकेज इंस्टॉल करें
RUN apk add --no-cache \
    shadowsocks-libev \
    gettext \
    && rm -rf /var/cache/apk/*

# कॉन्फ़िगरेशन डायरेक्टरी बनाएं
RUN mkdir -p /etc/shadowsocks-libev

# कॉपी करें और एंट्रीपॉइंट सेट करें
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# डिफ़ॉल्ट पोर्ट
EXPOSE 8388

# एंट्रीपॉइंट
ENTRYPOINT ["/entrypoint.sh"]
