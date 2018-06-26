FROM rabbitmq

LABEL maintainer="GPF <5173180@qq.com>"

RUN rabbitmq-plugins enable --offline rabbitmq_management
VOLUME [ "/var/lib/rabbitmq/mnesia" ]
# rabbitmq_1  |  node           : rabbit@68df1e21dea9
# rabbitmq_1  |  home dir       : /var/lib/rabbitmq
# rabbitmq_1  |  config file(s) : /etc/rabbitmq/rabbitmq.conf
# rabbitmq_1  |  cookie hash    : kAgGCkI4Yh9pBgJohglVUw==
# rabbitmq_1  |  log(s)         : <stdout>
# rabbitmq_1  |  database dir   : /var/lib/rabbitmq/mnesia/rabbit@68df1e21dea9


# 15671 是 https 端管理后台, 可访问 https://localhost:15671
# 15672 是 http 端管理后台, 可访问 http://localhost:15672
# 5672  是 amqp 协议接口
# 25672 集群端口
EXPOSE 5672 15671 15672 25672