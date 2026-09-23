FROM debian:12

RUN apt-get update && apt-get install -y nginx openssl

COPY tools/setup.sh	/setup.sh
COPY conf/ngx.conf	/etc/nginx/conf.d/ngx.conf

RUN chmod +x /setup.sh

ENTRYPOINT ["/setup.sh"]

