#!/bin/sh
mv /var/www/laravel-pre/* /var/www/laravel/
mv /var/www/laravel-pre/.?** /var/www/laravel/
chmod -R 1000:1000 /var/www/laravel
php-fpm -F