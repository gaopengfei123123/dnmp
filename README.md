### 环境需求
* docker for mac/win/各种平台
身为爱国人士就要有自觉配置国内镜像的觉悟, 推荐阿里的


### 快速开始
```bash
git clone https://github.com/gayhuber/dnmp.git
cd dnmp && cp env-example .env
# 启动之前根据自己的需要调整一下 .env 里的配置
docker-compose up -d --build
```
如果用了国内镜像的话等一会就好了

显示出 done 就说明启动完毕了
```bash
Starting dnmp-mysql   ... done
Starting dnmp-redis   ... done
Starting dnmp-php-fpm ... done
Starting dnmp-nginx   ... done
```
然后访问 `http://localhost:8089/` 就能看到结果了

### 目录
- www/ 下存放的都是运行代码
- logs/ 是输出 log 文件
- nginx/conf.d 是nginx 配置文件, 因为默认绑定的目录是 `www:/var/www`
- redis 和 mysql 的文件都绑定了各自的 `volume`, 通过 `docker volume ls` 查看




### 可能会用到的指令:
#### 查看容器运行状态:
```bash
➜  dnmp git:(master) ✗ docker-compose ps
    Name                  Command               State                      Ports
---------------------------------------------------------------------------------------------------
dnmp-mysql     docker-entrypoint.sh mysqld      Up      0.0.0.0:33060->3306/tcp
dnmp-nginx     nginx -g daemon off;             Up      0.0.0.0:4433->443/tcp, 0.0.0.0:8089->80/tcp
dnmp-php-fpm   docker-php-entrypoint php-fpm    Up      9000/tcp
dnmp-redis     docker-entrypoint.sh sh -c ...   Up      0.0.0.0:63790->6379/tcp
```

#### 进入指定容器
根据上面的提示, 想进入 `dnmp-redis` 这个容器,就执行:
```bash
➜  dnmp git:(master) ✗ docker exec -it dnmp-redis sh
```
因为有的容器是 `alpine` 版本, 所以进入容器时应该是找不到 `/bin/bash` 文件的,用 `sh`

#### 查看容器的数据 log
```bash
➜  dnmp git:(master) ✗ docker-compose logs -f
```