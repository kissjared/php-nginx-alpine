FROM kissjared/php:7.4-fpm-alpine

MAINTAINER Jared <jared_smile@126.com>

# Set correct environment variables
ENV IMAGE_USER=www
ENV HOME=/home/$IMAGE_USER
ENV COMPOSER_HOME=$HOME/composer
ENV TIMEZONE Asia/Shanghai
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

WORKDIR /tmp

# COPY INSTALL SCRIPTS
COPY ./scripts/*.sh /tmp/

RUN chmod +x /tmp/*.sh \
    && set -x \
    && mkdir -p /var/www \
    && mkdir -p /var/tmp/nginx/ \
    && mkdir /etc/supervisor.d \
    && apk update \
    && apk add --update --no-cache bash \
    && bash ./packages.sh \
    && bash ./composer.sh \
    && bash ./cleanup.sh

# Copy configuration to images
COPY config/nginx/nginx.conf /etc/nginx/nginx.conf
COPY config/nginx/mime.types /etc/nginx/mime.types
COPY config/nginx/conf.d   /etc/nginx/conf.d
COPY config/php/php-fpm.conf /usr/local/etc/php-fpm.conf
COPY config/php/php.ini /usr/local/etc/php/php.ini
COPY config/php/php-fpm.d/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY config/supervisord.conf /etc/supervisord.conf
COPY config/supervisor.d /etc/supervisor.d

# Copy source code to document root
COPY ./html /var/www/html

# Copy startup script
COPY ./startup.sh /opt/

RUN chmod +x /opt/startup.sh \
    && chown -R $IMAGE_USER:$IMAGE_USER /var/www \
    && chown -R $IMAGE_USER:$IMAGE_USER /var/lib/nginx \
    && chown -R $IMAGE_USER:$IMAGE_USER $HOME

WORKDIR /var/www/html

# Publish nginx vhost custom port
EXPOSE 80 443

VOLUME ['/var/www', '/etc/nginx/conf.d', '/usr/local/etc/php-fpm.d']

CMD ["/opt/startup.sh"]
