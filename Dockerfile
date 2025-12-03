FROM alpine:3.23

ARG VERSION
ENV DEV=/dev/ttyUSB0

RUN apk add --no-cache "smstools=${VERSION}" curl tzdata gettext-envsubst && \
    mkdir -p /var/spool/sms/outgoing /var/spool/sms/incoming /var/spool/sms/checked

ADD entrypoint.sh /entrypoint.sh
ADD handle_sms.sh /handle_sms.sh
ADD smsd.conf.template /etc/smsd.conf.template

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/smsd", "-c", "/tmp/smsd.conf"]