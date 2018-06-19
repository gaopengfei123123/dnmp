ARG PHP_VERSION=${PHP_VERSION}

# src: https://github.com/laradock/php-fpm
FROM laradock/php-fpm:2.0-${PHP_VERSION}

USER root
WORKDIR /var/www
CMD [ "php-fpm" ]