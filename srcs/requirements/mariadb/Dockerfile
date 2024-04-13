FROM debian:bullseye

EXPOSE 3306

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y apt-utils vim
RUN apt-get install -y mariadb-server
RUN dpkg --configure -a
COPY ./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/setup.sh /etc/mariadb/setup.sh
RUN chmod +x /etc/mariadb/setup.sh
RUN /etc/mariadb/setup.sh

CMD [ "mysqld_safe" ]
