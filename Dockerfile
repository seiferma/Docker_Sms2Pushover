FROM alpine:3.22

ARG VERSION

RUN apk add --no-cache "smstools=${VERSION}" curl tzdata && \
    mkdir -p /var/spool/sms/outgoing /var/spool/sms/incoming /var/spool/sms/checked

ADD entrypoint.sh /entrypoint.sh
ADD handle_sms.sh /handle_sms.sh
ADD smsd.conf /etc/smsd.conf

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/smsd"]