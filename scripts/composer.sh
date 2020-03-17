#!/bin/bash

# 修复iconv字符编码转换功能报错问题
apk add --no-cache gnu-libiconv \

# 安装composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \

# Install hirak/prestissimo to speedup composer installs.
composer global require hirak/prestissimo --prefer-dist --no-interaction \

# Using the Chinese mirror source
composer config -g repo.packagist composer https://packagist.phpcomposer.com \
    && rm -rf /root/.composer/cache/*
