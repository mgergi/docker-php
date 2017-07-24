#!/bin/sh
deluser  www-data
delgroup www-data
addgroup -g ${WWW_GID} -S ${WWW_GROUP}
adduser  -u ${WWW_UID} -D -S -G ${WWW_GROUP} ${WWW_USER}
php-fpm
