#!/bin/bash

WORDPRESS_DIR="/var/www/wordpress"

cp "$WORDPRESS_DIR/wp-config-sample.php" "$WORDPRESS_DIR/wp-config.php"

############## Database settings ############### 

DB_PASSWORD=$(cat /run/secrets/db_password)

sed -i "s/database_name_here/$DB_NAME/" "$WORDPRESS_DIR/wp-config.php"
sed -i "s/username_here/$DB_USER/"      "$WORDPRESS_DIR/wp-config.php"
sed -i "s/password_here/$DB_PASSWORD/"  "$WORDPRESS_DIR/wp-config.php"
sed -i "s/localhost/$DB_HOST/"          "$WORDPRESS_DIR/wp-config.php"

############## Secret keys ###############

curl -s https://api.wordpress.org/secret-key/1.1/salt/ > keys.txt

sed -i -e '/AUTH_KEY/,/NONCE_SALT/{/NONCE_SALT/r keys.txt' -e 'd;}' "$WORDPRESS_DIR/wp-config.php"

exec php-fpm8.2 -F 
