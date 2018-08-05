FROM php:7.2-cli-alpine3.7 as builder

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


# 二阶构建 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
FROM php:7.2-cli-alpine3.7 as runtimer

RUN echo "http://mirrors.ustc.edu.cn/alpine/v3.7/main/" > /etc/apk/repositories

RUN apk update && \
    apk upgrade && \
    apk add supervisor && \
    rm -rf /var/cache/apk/* && \
    mkdir /var/www

# 获取 swoole.so 文件
COPY --from=builder /usr/local/lib/php/extensions/no-debug-non-zts-20170718/swoole.so /usr/local/lib/php/extensions/no-debug-non-zts-20170718/swoole.so
# 配置 php 和 supervisor 文件
COPY ./swoole.ini /usr/local/etc/php/conf.d/swoole.ini
COPY ./supervisor/ /etc/supervisor/conf.d/

VOLUME ["/etc/supervisor/conf.d", "/var/log/supervisor/", "/var/www"]

WORKDIR /etc/supervisor/conf.d

EXPOSE 8080
CMD [ "supervisord", "--nodaemon","--configuration", "/etc/supervisor/conf.d/supervisord.conf" ]