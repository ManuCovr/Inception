FROM debian:12-slim
RUN apt-get update && apt-get install -y \
    nginx openssl \
    && rm -rf /var/lib/apt/lists/*

COPY tools/generate_certs.sh /generate_certs.sh
COPY conf/nginx.conf /etc/nginx/sites-available/default
RUN chmod +x /generate_certs.sh && /generate_certs.sh

CMD ["nginx", "-g", "daemon off;"]