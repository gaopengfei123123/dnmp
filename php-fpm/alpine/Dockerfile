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
RUN docker-php-ext-configure gd \
        --enable-gd-native-ttf \
        --with-jpeg-dir=/usr/lib \
        --with-freetype-dir=/usr/include/freetype2 && \
    docker-php-ext-install gd
    

# always run apt update when start and after add new source list, then clean up at end.
# RUN pecl channel-update pecl.php.net

COPY --from=builder /usr/local/lib/php/extensions/no-debug-non-zts-20170718/swoole.so /usr/local/lib/php/extensions/no-debug-non-zts-20170718/swoole.so
RUN echo "extension=swoole.so" > swoole.ini


ARG PHP_VERSION=${PHP_VERSION}

# 检测版本
RUN php -v | head -n 1 | grep -q "PHP ${PHP_VERSION}."

USER root