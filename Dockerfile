FROM debian:13.3-slim

VOLUME /var/www/html

RUN --mount=target=/var/lib/apt/lists,type=cache,sharing=locked \
    --mount=target=/var/cache/apt,type=cache,sharing=locked \
    rm -f /etc/apt/apt.conf.d/docker-clean \
    && apt-get update \
    && apt-get -y --no-install-recommends install \
        ca-certificates nginx-full libnginx-mod-http-cache-purge

CMD ["nginx", "-g", "daemon off;"]