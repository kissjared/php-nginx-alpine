# Docker Image for PHP7 AND Nginx

This PHP docker image based on [kissjared/php](https://hub.docker.com/r/kissjared/php).

## Supported tags and `Dockerfile` links

- [`7.4`, `latest` (Dockerfile)](https://github.com/kissjared/php-nginx-alpine/blob/master/Dockerfile)


## PHP Configuration
* PHP version:            `PHP 7.4.3`
* PHP FPM defconfig:      `/usr/local/etc/`
* PHP FPM core config:    `/usr/local/etc/php-fpm.conf`
* PHP FPM include config: `/usr/local/etc/php-fpm.d/`
* PHP shared extensions:  `/usr/local/lib/php/extensions/no-debug-non-zts-20190902/`
* PHP CLI binary:         `/usr/local/bin/`
* PHP FPM binary:         `/usr/local/sbin/`
### Fix iconv character encoding conversion error
```
apk add --no-cache gnu-libiconv
```
### Install composer
```
# Install composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \

# Install hirak/prestissimo to speedup composer installs.
composer global require hirak/prestissimo --prefer-dist --no-interaction \

# Using the Chinese mirror source
composer config -g repo.packagist composer https://packagist.phpcomposer.com 
```

### PHP Modules
```
[PHP Modules]
apcu
bcmath
bz2
calendar
Core
ctype
curl
date
dom
exif
fileinfo
filter
ftp
gd
gettext
hash
iconv
json
libxml
mbstring
mysqli
mysqlnd
openssl
pcntl
pcre
PDO
pdo_mysql
pdo_sqlite
Phar
posix
readline
redis
Reflection
session
SimpleXML
sockets
sodium
SPL
sqlite3
standard
tokenizer
xdebug
xml
xmlreader
xmlwriter
xsl
Zend OPcache
zlib

[Zend Modules]
Xdebug
Zend OPcache
```


