ARG arch
FROM jiesu/cron:${arch}

RUN apk --no-cache add git openssh

COPY gitconfig /home/jie/.gitconfig
RUN chown jie:jie /home/jie/.gitconfig

COPY job.sh init.sh /
RUN chmod +x /job.sh /init.sh

VOLUME /volume

