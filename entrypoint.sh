#!/bin/sh

if ! whoami &> /dev/null; then
    if [ -w /etc/passwd ]; then
        echo "Creating user entry in /etc/passwd"
        echo "swissarmy:x:$(id -u):$(id -g):swissarmy user:${HOME}:/sbin/nologin" >> /etc/passwd
        echo "Created user entry in /etc/passwd"
    fi
fi

exec "$@"
