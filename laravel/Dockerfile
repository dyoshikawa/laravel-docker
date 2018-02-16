FROM php:7-fpm-alpine

RUN apk -U add bash

RUN adduser -D -s /bin/sh -u 1000 dockeruser \
 && sed -i 's/user\ \=\ www-data/user\ \=\ dockeruser/g' /usr/local/etc/php-fpm.d/www.conf \
 && sed -i 's/group\ \=\ www-data/group\ \=\ dockeruser/g' /usr/local/etc/php-fpm.d/www.conf

# install sudo and set dockeruser sudoer
RUN apk add sudo \
 && echo 'dockeruser ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN docker-php-ext-install pdo_mysql mysqli

RUN apk add zip unzip \
 && curl -sS https://getcomposer.org/installer | php \
 && mv composer.phar /usr/local/bin/composer

RUN composer global require hirak/prestissimo
RUN composer create-project --prefer-dist laravel/laravel /var/www/laravel-pre
WORKDIR /var/www/laravel-pre
RUN composer require predis/predis \
 && composer require barryvdh/laravel-debugbar --dev \
 && composer install \
 && composer update

RUN mkdir /var/www/laravel
WORKDIR /var/www/laravel

ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 777 /docker-entrypoint.sh
USER dockeruser
ENTRYPOINT ["bash", "/docker-entrypoint.sh"]
