FROM alpine:3.9

USER root

RUN apk add --update --no-cache curl jq netcat-openbsd tcpdump bind-tools openssl rsync openssh

ENTRYPOINT ["/opt/entrypoint.sh", "/bin/sh"]

ADD entrypoint.sh /opt/entrypoint.sh

RUN chmod -R g=u /opt /etc/passwd && \
    chgrp -R root /opt && \
    chmod 755 /opt/entrypoint.sh

USER 1001
