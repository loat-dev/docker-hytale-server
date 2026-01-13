FROM eclipse-temurin:25-alpine

EXPOSE 5520

VOLUME ["/data"]
WORKDIR /data

RUN apk add --no-cache \
  curl \
  jq \
  unzip

RUN ./prepare/get_downloader.sh
COPY --chmod=+x ./downloader /usr/src/downloader

COPY --chmod=+x ./src/* /usr/src/

ENTRYPOINT ["/usr/src/main.sh"]
HEALTHCHECK --start-period=2m --retries=2 --interval=30s \
  CMD /usr/src/healthcheck.sh
