FROM debian:bullseye

EXPOSE 9000

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install \
	wget vim \
	php7.4 php-fpm php-mysql \
	mariadb-client \
	redis php-redis

RUN wget https://fr.wordpress.org/wordpress-6.5.2-fr_FR.tar.gz -P /var/www

RUN cd /var/www/ && tar -xzf wordpress-6.5.2-fr_FR.tar.gz && rm wordpress-6.5.2-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress


COPY conf/php.ini /etc/php/7.4/cli/php.ini
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN mkdir -p /run/php


RUN mv wp-cli.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

COPY tools/autoconf.sh /
RUN /bin/bash /autoconf.sh
RUN rm /autoconf.sh


CMD /usr/sbin/php-fpm7.4 -F
