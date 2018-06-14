FROM nginx:1.13.1-alpine

MAINTAINER GPF <5173180@qq.com>

#https://yeasy.gitbooks.io/docker_practice/content/image/build.html
RUN mkdir -p /etc/nginx/cert \
    && mkdir -p /etc/nginx/conf.d

COPY ./nginx.conf /etc/ngixn/nginx.conf
COPY ./conf.d/ /etc/nginx/conf.d/
COPY ./cert/ /etc/nginx/cert/

VOLUME /var/log/nginx

WORKDIR /usr/share/nginx/html