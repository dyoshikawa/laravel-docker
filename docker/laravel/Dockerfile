FROM php:7-fpm-alpine

# install bash
RUN apk -U add bash

# add dockeruser and setup php-fpm
RUN adduser -D -s /bin/sh -u 1000 dockeruser \
 && sed -i 's/user\ \=\ www-data/user\ \=\ dockeruser/g' /usr/local/etc/php-fpm.d/www.conf \
 && sed -i 's/group\ \=\ www-data/group\ \=\ dockeruser/g' /usr/local/etc/php-fpm.d/www.conf

# install sudo and set dockeruser sudoer
RUN apk add sudo \
 && echo 'dockeruser ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

# install PHP extensions
RUN docker-php-ext-install pdo_mysql mysqli mbstring

# install zip, unzip and composer
RUN apk add zip unzip \
 && curl -sS https://getcomposer.org/installer | php \
 && mv composer.phar /usr/local/bin/composer

# install composer plugin
RUN composer global require hirak/prestissimo

# create Laravel project
RUN composer create-project --prefer-dist laravel/laravel /var/www/laravel-pre
WORKDIR /var/www/laravel-pre
RUN composer require predis/predis \
 && composer require barryvdh/laravel-debugbar --dev \
 && composer install \
 && composer update

# create and set workdir
RUN mkdir /var/www/laravel
WORKDIR /var/www/laravel

# setup entrypoint
ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 777 /docker-entrypoint.sh
USER dockeruser
ENTRYPOINT ["bash", "/docker-entrypoint.sh"]
