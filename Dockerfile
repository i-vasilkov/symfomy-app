FROM php:8.0-fpm-alpine

RUN docker-php-ext-install pdo pdo_mysql

RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug-3.0.4 \
    && docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | \
        php -- --filename=composer \
        --install-dir=/usr/local/bin

WORKDIR /var/www/app