FROM python:3.9-slim

# Shadowsocks pip पैकेज इंस्टॉल करें
RUN pip install --no-cache-dir shadowsocks

# डिफ़ॉल्ट एनवायरनमेंट वेरिएबल्स
ENV SS_PORT=8388
ENV SS_PASSWORD=Ethan@0927
ENV SS_METHOD=chacha20-ietf-poly1305

# पोर्ट खोलें
EXPOSE 8388

# सर्वर शुरू करें (ssserver कमांड Python पैकेज से आता है)
CMD ssserver -p $SS_PORT -k $SS_PASSWORD -m $SS_METHOD -d 0.0.0.0
