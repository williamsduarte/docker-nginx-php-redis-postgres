#!/bin/bash
#Update
apt-get update
sleep 5
# Change access rights for the Laravel folders
# in order to make Laravel able to access
# cache and logs folder.
chgrp -R www-data storage bootstrap/cache
chown -R www-data storage bootstrap/cache
chmod -R 775 storage bootstrap/cache

chgrp -R www-data storage storage/framework/cache
chown -R www-data storage storage/framework/cache
chmod -R 775 storage storage/framework/cache

chgrp -R www-data storage storage/app
chown -R www-data storage storage/app
chmod -R 775 storage storage/app

chgrp -R www-data storage storage/framework/views
chown -R www-data storage storage/framework/views
chmod -R 775 storage storage/framework/views

chgrp -R www-data storage storage/logs
chown -R www-data storage storage/logs
chmod -R 777 storage storage/logs

# Create the symbolic link
ln -s public html
sleep 5

# access to the folder structure
composer install
sleep 5

composer require predis/predis --ignore-platform-reqs
sleep 5

php artisan key:generate
php artisan migrate:fresh --seed
sleep 5

apt-get update
apt-get install --reinstall ca-certificates

echo "Tudo pronto!!!"
