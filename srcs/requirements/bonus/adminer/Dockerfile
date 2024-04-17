FROM debian:bullseye

EXPOSE 9000

RUN apt-get update -y && apt-get upgrade -y 
RUN apt-get install wget php php-mysql -y
COPY ./tools/setup.sh /

CMD ["/bin/bash", "/setup.sh"]
