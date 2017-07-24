FROM debian:wheezy-slim

ENV WWW_UID 82
ENV WWW_GID 82
ENV WWW_USER www-data
ENV WWW_GROUP www-data

RUN apt-get update \
&&  apt-get install -y --no-install-recommends php5-fpm php5-mysql php5-gd php5-intl php-apc php-geshi php5-cli \
&&  rm /etc/php5/fpm/pool.d/www.conf \
&&  ln /usr/sbin/php5-fpm /usr/bin/php5-fpm

ADD www.conf /etc/php5/fpm/pool.d
ADD start.sh /

EXPOSE 9000

CMD ["/bin/bash", "/start.sh"]
