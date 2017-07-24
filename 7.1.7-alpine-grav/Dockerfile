FROM mgergi/php-fpm:7.1.7-alpine

RUN apk upgrade --update && apk add libpng-dev freetype-dev libjpeg-turbo-dev \
&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-configure zip \
&& docker-php-ext-install gd zip
