#! /bin/sh
echo "Building php-swoole:build"

docker build . -f Dockerfile-build-swoole -t php-swoole:build
docker create --name swoole-container php-swoole:build
docker cp swoole-container:/usr/local/lib/php/extensions/no-debug-non-zts-20131226/swoole.so ./swoole.so

echo "output swoole.so , bye"