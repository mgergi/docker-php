# Supported tags and respective `Dockerfile` links

- `7.1.7-alpine`, `7.1-alpine`, `7-alpine`, `alpine`, `7.1.7`, `7.1`, `7`, `latest` [(*7-alpine/Dockerfile*)](https://github.com/mgergi/docker-php/blob/master/7-alpine/Dockerfile)
- `7.1.7-alpine-grav`, `7.1-alpine-grav`, `7-alpine-grav`, `alpine-grav`, `7.1.7-grav`, `7.1-grav`, `7-grav`, `grav` [(*7-alpine-grav/Dockerfile*)](https://github.com/mgergi/docker-php/blob/master/7-alpine-grav/Dockerfile)
- `7.1.7-alpine-mediawiki`, `7.1-alpine-mediawiki`, `7-alpine-mediawiki`, `alpine-mediawiki`, `7.1.7-mediawiki`, `7.1-mediawiki`, `7-mediawiki`, `mediawiki` [(*7-alpine-mediawiki/Dockerfile*)](https://github.com/mgergi/docker-php/blob/master/7-alpine-mediawiki/Dockerfile)


# How to use this image.

## With docker-compose

Here is an example using nginx, php-fpm and mariadb with docker-compse

    version: '3'
    services:
      web:
        image: nginx:alpine
        ports:
          - 127.0.0.1:8081:80/tcp
        volumes:
          - ./nginx_site.conf:/etc/nginx/conf.d/default.conf
          - webdir:/www:ro
        depends_on:
          - php
        restart: always
      php:
        image: mgergi/php-fpm:mediawiki
        environment:
          WWW_UID: 1001
          WWW_GID: 1001
        volumes:
          - ./php_pool.conf:/usr/local/etc/php-fpm.d/www.conf
          - webdir:/www
        depends_on:
          - sql
        restart: always
      sql:
        image: mariadb
        environment:
          MYSQL_ROOT_PASSWORD: Tn23HiirB0EeB9ZBAibarsFLxuUCrF7B
          MYSQL_USER: wikiadmin
          MYSQL_PASSWORD: 1BIq6UlSmKfQTSNEzZZ4X7Q2hhnSJUrd
          MYSQL_DATABASE: wiki
        volumes:
          - db_dir:/var/lib/mysql
        restart: always
    volumes:
      db_dir:
      webdir:


The webdir volume must be mounted on a same path in both services. 
The files in webdir must be owned by a user whose UID is equal to WWW_UID.


# Image Variants


## `php:<version>`

This is the base variant, based on official [php:fpm-alpine](https://hub.docker.com/_/php/). 

## `php:*grav`

This image was created for [Grav CMS](https://getgrav.org/). It includes php-gd and php-zip.

## `php:*mediawiki`

This version was created for [MediaWiki](https://www.mediawiki.org/wiki/MediaWiki) systems. It includes php-apcu, php-gd, php-intl, php-mysqli and php-zip extensions.
