#!/bin/sh

# startup nginx/php-fpm services
/usr/bin/supervisord -c /etc/supervisord.conf 1>>/dev/stdout 2>>/dev/stderr
