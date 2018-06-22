FROM redis:3.2-alpine

LABEL AUTHOR="GPF <5173180@qq.com>" 

ENV REDIS_PASSWORD developer

VOLUME /data

EXPOSE 6379

CMD ["sh", "-c", "exec redis-server --requirepass \"$REDIS_PASSWORD\""]