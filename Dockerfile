FROM uselagoon/nginx

RUN apk add socat \
    && apk add --update-cache \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
        --allow-untrusted --update tor \
    && rm -rf /var/cache/apk/*

COPY ./torrc /etc/tor/torrc
COPY 99-entrypoint-tor.sh /lagoon/entrypoints/99-entrypoint-tor.sh

COPY proxy.conf /etc/nginx/conf.d/app.conf