FROM php:7-fpm-alpine

RUN apk update
RUN docker-php-ext-install pdo_mysql mysqli

RUN apk add -y zip unzip
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN adduser -D -s /bin/sh -u 1000 dockeruser
RUN sed -i 's/user\ \=\ www-data/user\ \=\ dockeruser/g' /usr/local/etc/php-fpm.d/www.conf
RUN sed -i 's/group\ \=\ www-data/group\ \=\ dockeruser/g' /usr/local/etc/php-fpm.d/www.conf

RUN mkdir /var/www/app
WORKDIR /var/www/app