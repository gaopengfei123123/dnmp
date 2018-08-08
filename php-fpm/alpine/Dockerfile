FROM php:7.2-fpm-alpine3.7 as builder

# 中国特色
RUN echo "http://mirrors.ustc.edu.cn/alpine/v3.7/main/" > /etc/apk/repositories

# 添加编译 swoole 需要的前置插件
RUN apk update && \
    apk upgrade && \
    apk add alpine-sdk linux-headers && \
    apk add autoconf gcc make

# 编译 swoole 2.2 
RUN wget https://github.com/swoole/swoole-src/archive/v2.2.0.tar.gz && \
    tar zxvf v2.2.0.tar.gz && \
    cd swoole-src-2.2.0/ && \
    phpize && \
    ./configure && \
    make && make install




FROM php:7.2-fpm-alpine3.7 as runtimer

# php 72 官方已经移除 mcrypt, 因此需要先 pecl 安装一下
# RUN pecl install mcrypt-1.0.1 && docker-php-ext-install mcrypt

# Install the PHP pdo_mysql extention
RUN docker-php-ext-install pdo_mysql

# #####################################
# # gd:
# #####################################

# Install the PHP gd library
# 来源：https://github.com/docker-library/php/issues/225#issuecomment-226870896
RUN apk add --no-cache freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev && \
  docker-php-ext-configure gd \
    --with-gd \
    --with-freetype-dir=/usr/include/ \
    --with-png-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ && \
  NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
  docker-php-ext-install -j${NPROC} gd && \
  apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev
    

# always run apt update when start and after add new source list, then clean up at end.
# RUN pecl channel-update pecl.php.net

COPY --from=builder /usr/local/lib/php/extensions/no-debug-non-zts-20170718/swoole.so /usr/local/lib/php/extensions/no-debug-non-zts-20170718/swoole.so
RUN echo "extension=swoole.so" > /usr/local/etc/php/conf.d/swoole.ini

ARG PHP_VERSION=${PHP_VERSION}

# 检测版本
RUN php -v | head -n 1 | grep -q "PHP ${PHP_VERSION}."

USER root

WORKDIR /var/www

# 来源： https://github.com/chrootLogin/docker-nextcloud/issues/3#issuecomment-271626117
RUN RUN apk --no-cache add shadow && usermod -u 1000 www-data

CMD [ "php-fpm" ]

EXPOSE 9000