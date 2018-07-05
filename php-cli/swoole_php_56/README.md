这里把编译 swoole 和运行 swoole 的环境给分开了, 因为编译产生的体积太大了

![docker-images](./docker-images.png)

如果 cli 环境中需要用到swoole , 则运行`./build_swoole.sh` 将 `swoole.so` 输出后再启动