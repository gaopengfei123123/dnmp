ARG PHP_VERSION=${PHP_VERSION}

# src: https://github.com/laradock/php-fpm
FROM laradock/php-fpm:2.0-${PHP_VERSION}

# always run apt update when start and after add new source list, then clean up at end.
RUN apt-get update -yqq && \
    pecl channel-update pecl.php.net

ARG PHP_VERSION=${PHP_VERSION}

# 检测版本
RUN php -v | head -n 1 | grep -q "PHP ${PHP_VERSION}."

USER root

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog

WORKDIR /var/www

RUN usermod -u 1000 www-data

CMD [ "php-fpm" ]

EXPOSE 9000