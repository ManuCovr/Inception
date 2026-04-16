#!/bin/bash
set -e
export HTTP_HOST="${HTTP_HOST:-mde-maga.42.fr}"
mkdir -p /var/www/html
cd /var/www/html
# install WP-CLI
if [ ! -x /usr/local/bin/wp ]; then
curl -sO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
fi
if [ ! -f index.php ]; then
wp core download --allow-root
fi
if [ ! -f wp-config.php ]; then
mv wp-config-sample.php wp-config.php
wp config set DB_NAME "$MYSQL_DATABASE" --allow-root
wp config set DB_USER "$MYSQL_USER" --allow-root
wp config set DB_PASSWORD "$(cat /run/secrets/db_password)" --allow-root
wp config set DB_HOST "mariadb:3306" --allow-root
fi
set +e
until mysql -h mariadb -u "$MYSQL_USER" -p"$(cat /run/secrets/db_password)" -e "SELECT 1;" > /dev/null 2>&1; do
echo "Waiting for MariaDB..."
sleep 2
done
set -e
if ! wp core is-installed --allow-root; then
wp core install \
--url="https://mde-maga.42.fr" \
--title="Inception Site" \
--admin_user="${WP_ADMIN_USER:-webmaster}" \
--admin_password="$(cat /run/secrets/wordpress_admin_password)" \
--admin_email="${WP_ADMIN_EMAIL:-webmaster@mde-maga.42.fr}" \
--allow-root \
--skip-email
fi
# guard against rerun on restart
if ! wp user get wpuser --allow-root > /dev/null 2>&1; then
wp user create wpuser wpuser@mde-maga.42.fr \
--user_pass="wpuser123" \
--role=author \
--allow-root
fi
wp user update webmaster --display_name="mde-maga" --allow-root
wp post update 1 --post_title="Welcome to Inception" --post_content="My 42 Docker project." --allow-root
wp option update blogdescription "42 School Docker Project" --allow-root
mkdir -p /run/php
exec $(ls /usr/sbin/php-fpm*) -F