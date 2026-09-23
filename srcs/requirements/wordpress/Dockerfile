FROM debian:12

RUN apt update && apt install -y php-fpm && apt install -y curl

RUN sed -i 's|^listen = .*|listen = 9000|' /etc/php/8.2/fpm/pool.d/www.conf

RUN curl -LO https://wordpress.org/latest.tar.gz

RUN mkdir -p /var/www
RUN tar -xzf latest.tar.gz -C /var/www && rm latest.tar.gz

COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

ENTRYPOINT ["/setup.sh"]


