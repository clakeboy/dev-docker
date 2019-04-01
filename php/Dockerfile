FROM php:7.2.8-fpm-alpine
LABEL maintainer "clakeboy@gmail.com"

ENV PHPREDIS_VERSION 4.1.1
RUN apk add --no-cache \
    libpng libpng-dev libjpeg
RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mkdir -p /usr/src/php/ext \
    && mv phpredis-$PHPREDIS_VERSION /usr/src/php/ext/redis \
    && docker-php-ext-install redis pdo_mysql gd \
    && rm -rf /usr/src/php
#如果不加删除操作构建的镜像将大100M 