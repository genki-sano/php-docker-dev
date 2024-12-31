FROM php:8.3-fpm

RUN apt-get update \
    && apt-get install -y --no-install-recommends git curl zip unzip vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install opcache bcmath pdo_mysql mysqli

# イメージのビルド時に実行しておかないと、エラーが発生する
COPY ./conf.d/opcache.ini /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html
