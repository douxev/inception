#!/bin/bash
cd /var/www/wordpress
sleep 10

# exit 12
/usr/local/bin/wp config create	--allow-root \
					--dbname=$SQL_DATABASE \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD \
					--dbhost=mariadb:3306


/usr/local/bin/wp core install --title=$WP_TITLE \
				--admin_user=$WP_ADMIN_USER \
				--admin_password=$WP_ADMIN_PASSWORD \
				--admin_email=$WP_ADMIN_MAIL \
				--url=$WP_URL \
				--allow-root

# /usr/local/bin/wp core config	\
# 				--dbhost=mariadb:3306 --path='/var/www/wordpress' \
# 				--dbname=$SQL_DATABASE \
# 				--dbuser=$SQL_USER \
# 				--dbpass=$SQL_PASSWORD \
# 				--allow-root

/usr/local/bin/wp user create $WP_USER $WP_USER_MAIL \
				--role=author \
				--user_pass=$WP_USER_PASSWORD\
				--allow-root

/usr/sbin/php-fpm7.4
cat wp-config.php
sleep 20
/usr/local/bin/wp config set WP_REDIS_HOST redis --allow-root
/usr/local/bin/wp config set WP_REDIS_PORT 6379 --raw --allow-root
/usr/local/bin/wp config set WP_CACHE_KEY_SALT jdoukhan.42.fr --allow-root
/usr/local/bin/wp config set WP_REDIS_CLIENT phpredis --allow-root
sleep 5
/usr/local/bin/wp plugin install redis-cache --activate --allow-root
/usr/local/bin/wp plugin update --all --allow-root
/usr/local/bin/wp redis enable --allow-root

cd -
