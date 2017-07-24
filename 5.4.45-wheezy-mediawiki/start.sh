#!/bin/bash
groupmod -g ${WWW_GID}   www-data
[ ${WWW_GROUP} = "www-data" ] || groupmod -n ${WWW_GROUP} www-data
usermod  -u ${WWW_UID}   www-data
[ ${WWW_USER} = "www-data" ]  || usermod  -l ${WWW_USER}  www-data
/usr/bin/php5-fpm -F 
/bin/bash
