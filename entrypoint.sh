#!/bin/sh

# डिफ़ॉल्ट वैल्यू सेट करें
PASSWORD="${PASSWORD:-$(openssl rand -base64 16)}"
METHOD="${METHOD:-chacha20-ietf-poly1305}"
PORT="${PORT:-8388}"
TIMEOUT="${TIMEOUT:-300}"
DNS_ADDRS="${DNS_ADDRS:-8.8.8.8,8.8.4.4}"

# कॉन्फ़िगरेशन फ़ाइल बनाएं
cat > /etc/shadowsocks-libev/config.json << EOF
{
    "server": "0.0.0.0",
    "server_port": ${PORT},
    "password": "${PASSWORD}",
    "method": "${METHOD}",
    "timeout": ${TIMEOUT},
    "dns_addrs": [${DNS_ADDRS}],
    "fast_open": true
}
EOF

# पासवर्ड लॉग में दिखाएं (डिप्लॉयमेंट के बाद चेक करने के लिए)
echo "=========================================="
echo "Shadowsocks सर्वर चालू हो रहा है..."
echo "पोर्ट: ${PORT}"
echo "पासवर्ड: ${PASSWORD}"
echo "एन्क्रिप्शन: ${METHOD}"
echo "=========================================="

# Shadowsocks सर्वर शुरू करें
exec ss-server -c /etc/shadowsocks-libev/config.json -v
