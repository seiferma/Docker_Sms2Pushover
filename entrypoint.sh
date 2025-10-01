#!/bin/sh

if [[ -z "$PUSHOVER_TOKEN_API" ]]; then
    echo "PUSHOVER_TOKEN_API has to be given as environment variable"
    exit 1
fi

if [[ -z "$PUSHOVER_TOKEN_USER" ]]; then
    echo "PUSHOVER_TOKEN_USER has to be given as environment variable"
    exit 1
fi

envsubst < /etc/smsd.conf.template > /tmp/smsd.conf

exec "$@"