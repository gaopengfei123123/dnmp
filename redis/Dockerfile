FROM redis:3.2-alpine

LABEL AUTHOR="GPF <5173180@qq.com>" 

ARG REDIS_SET_PASSWORD=developer
ENV REDIS_PASSWORD ${REDIS_SET_PASSWORD}

VOLUME /data

EXPOSE 6379

CMD ["sh", "-c", "exec redis-server --requirepass \"$REDIS_PASSWORD\""]