FROM php:5.6.36-cli-alpine3.7

COPY ./swoole_php_56/swoole.so /usr/local/lib/php/extensions/no-debug-non-zts-20131226/swoole.so

COPY ./swoole.ini /usr/local/etc/php/conf.d/swoole.ini

RUN ["php", "-a"]