#!/bin/bash

# wordpress download
mkdir -p /var/www/html
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x /var/www/html/wp-cli.phar
mv /var/www/html/wp-cli.phar /usr/bin/
wp-cli.phar core download --version=6.4.3 --allow-root

# wordpress configure
wp-cli.phar core config --dbname=$DB_NAME --dbuser=$DB_ADMIN_NAME --dbpass=$DB_ADMIN_PASSWORD --dbhost=mariadb --dbprefix=wp_ --allow-root

# wordpress install & user and theme setting
wp-cli.phar core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp-cli.phar user create $WP_USER_NAME $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=author --allow-root
wp-cli.phar theme install storefront --activate --allow-root

# php-fpm port setting and demon run
sed -ir 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf
/etc/init.d/php7.4-fpm start
/etc/init.d/php7.4-fpm stop
/usr/sbin/php-fpm7.4 -F
