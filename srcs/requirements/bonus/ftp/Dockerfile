FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install vsftpd -y

ARG FTP_USER=${FTP_USER}
ARG FTP_PASSWORD=${FTP_PASSWORD}

COPY conf/ftp.env /
COPY conf/vsftpd.conf /
COPY tools/server.sh /
RUN /bin/bash /server.sh

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]