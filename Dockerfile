FROM alpine:3.9

RUN apk add --update --no-cache curl jq netcat-openbsd tcpdump bind-tools
