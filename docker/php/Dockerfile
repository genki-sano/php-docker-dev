FROM php:8.3-fpm

RUN apt-get update \
    && apt-get install -y --no-install-recommends git curl zip unzip vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install opcache bcmath pdo_mysql mysqli

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html
