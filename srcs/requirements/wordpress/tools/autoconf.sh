#!/bin/bash
cd /var/www/wordpress
sleep 10

# exit 12
wp config create	--allow-root \
					--dbname=$SQL_DATABASE \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD \
					--dbhost=mariadb:3306


wp core install --title=$WP_TITLE \
				--admin_user=$WP_ADMIN_USER \
				--admin_password=$WP_ADMIN_PASSWORD \
				--admin_email=$WP_ADMIN_MAIL \
				--url=$WP_URL \
				--allow-root

# wp core config	\
# 				--dbhost=mariadb:3306 --path='/var/www/wordpress' \
# 				--dbname=$SQL_DATABASE \
# 				--dbuser=$SQL_USER \
# 				--dbpass=$SQL_PASSWORD \
# 				--allow-root

wp user create $WP_USER $WP_USER_MAIL \
				--role=author \
				--user_pass=$WP_USER_PASSWORD\
				--allow-root

# /usr/sbin/php-fpm7.4

wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root
wp redis enable --allow-root

wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --raw --allow-root
wp config set WP_CACHE_KEY_SALT jdoukhan.42.fr --allow-root
wp config set WP_REDIS_CLIENT phpredis --allow-root
wp config set WP_REDIS_DATABASE "15" --allow-root
sleep 5
chmod 755 -R /var/www/wordpress/wp-content

cat /config.php >> /var/www/wordpress/wp-includes/functions.php


cd -
