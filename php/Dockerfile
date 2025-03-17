FROM php:7.4-fpm-alpine
LABEL maintainer "clakeboy@gmail.com"

#复制opcache配置文件
# COPY opcache.ini $PHP_INI_DIR/opcache.ini

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# ENV PHPREDIS_VERSION 4.1.1
#替换alpine apk源为国内中科大开源镜像站
RUN sed -i 's/http:\/\/dl-cdn.alpinelinux.org/https:\/\/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache \
    libpng libpng-dev libjpeg autoconf g++ make openssl-dev \
    && docker-php-ext-install pdo_mysql gd opcache \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && pecl install mongodb \
    && docker-php-ext-enable mongodb \
    && pecl clear-cache \
    && apk del autoconf g++ make \
    && rm -rf /var/cache/apk/*
# 镜像生成注意 每一层RUN运行完成后需要清理本层RUN的包,要不然镜像最后生成会非常巨大 by clake