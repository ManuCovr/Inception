FROM debian:12-slim
RUN apt-get update \
 && apt-get install -y \
      php-fpm php-mysql php-mbstring php-xml php-zip php-gd \
      curl mariadb-client \
 && rm -rf /var/lib/apt/lists/* \
 && sed -i 's/^listen = .*/listen = 0.0.0.0:9000/' /etc/php/*/fpm/pool.d/www.conf
COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh
CMD ["/setup.sh"]