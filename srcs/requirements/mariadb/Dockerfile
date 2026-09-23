FROM debian:12

RUN mkdir -p /var/lib/mysql/mysql
RUN touch /var/lib/mysql/mysql/usr.frm

RUN apt-get update && apt-get install -y mariadb-server

RUN rm -rf /var/lib/mysql
RUN mkdir -p /var/lib/mysql

COPY conf/99-inception.cnf /etc/mysql/mariadb.conf.d/99-inception.cnf

COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

ENTRYPOINT ["/setup.sh"]
