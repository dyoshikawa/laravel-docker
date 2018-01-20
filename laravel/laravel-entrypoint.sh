#!/bin/sh
sudo mv /var/www/laravel-pre/* /var/www/laravel/
sudo mv /var/www/laravel-pre/.?** /var/www/laravel/
sudo rmdir /var/www/laravel-pre
sudo chown -R 1000:1000 /var/www/laravel
sudo php-fpm -F