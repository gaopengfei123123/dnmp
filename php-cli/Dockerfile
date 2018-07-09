FROM php:5.6.36-cli-alpine3.7 as builder

# 中国特色
RUN echo "http://mirrors.ustc.edu.cn/alpine/v3.7/main/" > /etc/apk/repositories

# 添加编译 swoole 需要的前置插件
RUN apk update && \
    apk upgrade && \
    apk add alpine-sdk linux-headers && \
    apk add autoconf gcc make

RUN wget https://github.com/swoole/swoole-src/archive/1.8.12-stable.tar.gz && \
    tar zxvf 1.8.12-stable.tar.gz && \
    cd swoole-src-1.8.12-stable && \
    phpize && \
    ./configure && \
    make && make install




FROM php:5.6.36-cli-alpine3.7 as runtimer

COPY --from=builder /usr/local/lib/php/extensions/no-debug-non-zts-20131226/swoole.so /usr/local/lib/php/extensions/no-debug-non-zts-20131226/swoole.so

COPY ./swoole.ini /usr/local/etc/php/conf.d/swoole.ini

RUN ["php", "-m"]