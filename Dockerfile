FROM alpine:3.9
LABEL maintainer="Nikita Verkhovin <vernik91@gmail.com>"

RUN set -x \
  && apk add --no-cache \
    py-pip \
    duplicity \
    ca-certificates \
    curl \
    && pip install fasteners

COPY bin/* /bin/
COPY docker-entrypoint.sh /entrypoint.sh

ENV BACKUP_TIME 0 3 * * *

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/crond", "-f"]
