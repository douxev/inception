#!/bin/sh

mkdir -p /var/www/html
mkdir -p /etc/vsftpd
mkdir -p /var/run/vsftpd/empty
mv /vsftpd.conf /etc/vsftpd/

source /ftp.env
adduser $FTP_USER --disabled-password --gecos ""
echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd &> /dev/null
chown -R $FTP_USER:$FTP_USER /var/www/html
usermod -s /sbin/nologin $FTP_USER
chmod a-w /home/$FTP_USER
chmod +x /etc/vsftpd.conf

echo $FTP_USER | tee -a /etc/vsftpd/vsftpd.userlist &> /dev/null
echo "FTP started on port 21"
