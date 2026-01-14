FROM eclipse-temurin:25-jdk

EXPOSE 5520/udp

ENV PORT=5520
ENV DOWNLOAD_NEW_FILES_ON_START=false
ENV MIN_MENORY="1G"
ENV MAX_MENORY="4G"
ENV EXTRA_ARGS=""

VOLUME ["/data"]
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
