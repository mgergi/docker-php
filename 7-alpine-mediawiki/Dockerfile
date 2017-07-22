FROM mgergi/php-fpm:7.1.7-alpine

RUN apk upgrade --update \
&& apk add autoconf gcc libc-dev make pcre-dev \
&& apk add libpng libpng-dev freetype freetype-dev libjpeg-turbo libjpeg-turbo-dev icu-libs icu-dev \
&& apk add diffutils \
&& pecl install apcu \
&& docker-php-ext-enable apcu \
&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-configure intl \
&& docker-php-ext-configure mysqli \
&& docker-php-ext-configure zip \
&& docker-php-ext-install gd intl mysqli zip \
&& apk del autoconf gcc libc-dev make libpng-dev freetype-dev  libjpeg-turbo-dev  icu-dev
