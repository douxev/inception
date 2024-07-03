FROM debian:bullseye

EXPOSE 3306



# ARG SQL_DATABASE=${SQL_DATABASE}
# ARG SQL_USER=${SQL_USER}
# ARG SQL_PASSWORD=${SQL_PASSWORD}
# ARG SQL_ROOT_PASSWORD=${SQL_ROOT_PASSWORD}


RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y apt-utils mariadb-server
RUN dpkg --configure -a
RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/

RUN mkdir -p /run/mysqld
RUN chmod 755 /run/mysqld

RUN chown -R mysql:root /var/lib/mysql
RUN chown -R mysql:root /var/run/mysqld

COPY tools/setup.sh /
RUN chmod 755 /setup.sh
COPY conf/.config /
RUN /bin/bash /setup.sh
RUN rm /setup.sh /.config

CMD ["mysqld_safe"]
