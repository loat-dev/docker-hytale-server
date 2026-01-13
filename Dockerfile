FROM eclipse-temurin:25-alpine

EXPOSE 5520

VOLUME ["/data"]
WORKDIR /data

RUN apk add --no-cache \
  curl \
  jq \
  unzip

COPY --chmod=+x ./src/* /app/

ENTRYPOINT ["/app/main.sh"]
HEALTHCHECK --start-period=2m --retries=2 --interval=30s \
  CMD /app/healthcheck.sh
