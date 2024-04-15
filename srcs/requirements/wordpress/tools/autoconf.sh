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

# wp redis enable --allow-root
cd -
