FROM alpine:3.20

RUN apk update && \
    apk add --no-cache etherwake iputils >/dev/null 2>&1 && \
    rm -rf /var/cache/apk/*

COPY wol.sh /usr/local/bin/wol.sh

RUN chmod +x /usr/local/bin/wol.sh

ENTRYPOINT ["/usr/local/bin/wol.sh"]

