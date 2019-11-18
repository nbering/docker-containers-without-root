FROM debian:buster-slim

RUN set -eux; \
    apt-get update; \
    apt-get install -y gosu procps; \
    rm -rf /var/lib/apt/lists/*;

COPY samples/03_gosu/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
