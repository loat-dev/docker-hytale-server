FROM eclipse-temurin:25-jdk

EXPOSE 5520/udp

ENV PORT=5520

ENV MIN_MEMORY="1G"
ENV MAX_MEMORY="4G"

ENV ENABLE_DOWNLOAD_NEW_FILES_ON_START=false

ENV ENABLE_PERSISTENT_LOGIN=true

ENV ENABLE_BACKUP=true
ENV BACKUP_FREQUENCY=30
ENV BACKUP_MAX_COUNT=5

ENV EXTRA_ARGS=""

VOLUME ["/data"]
VOLUME ["/backup"]

WORKDIR /data

RUN apt-get update && apt-get install -y --no-install-recommends \
  curl \
  jq \
  unzip \
  tree \
  && rm -rf /var/lib/apt/lists/*

COPY --chmod=+x ./src/ /app/
RUN tree /app

ENTRYPOINT ["/app/main.sh"]
HEALTHCHECK --start-period=2m --retries=2 --interval=30s \
  CMD /app/health/check.sh
