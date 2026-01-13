FROM eclipse-temurin:25-jdk

EXPOSE 5520

VOLUME ["/data"]
WORKDIR /data

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    jq \
    unzip \
    tree \
 && rm -rf /var/lib/apt/lists/*

COPY --chmod=+x ./src/* /app/

ENTRYPOINT ["/app/main.sh"]
HEALTHCHECK --start-period=2m --retries=2 --interval=30s \
  CMD /app/healthcheck.sh
