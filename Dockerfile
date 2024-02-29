FROM alpine:3.19
LABEL org.opencontainers.image.source https://github.com/hfuss/swiss-army-knife

USER root

RUN apk add --update --no-cache curl jq netcat-openbsd tcpdump bind-tools openssl rsync openssh tcptraceroute aws-cli \
    && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

ENTRYPOINT ["/opt/entrypoint.sh", "/bin/sh"]

ADD entrypoint.sh /opt/entrypoint.sh

RUN chmod -R g=u /opt /etc/passwd && \
    chgrp -R root /opt && \
    chmod 755 /opt/entrypoint.sh

USER 1001
