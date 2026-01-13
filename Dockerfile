FROM eclipse-temurin:25-alpine

EXPOSE 5520

RUN apk add --no-cache \
  curl \
  jq \
  unzip

WORKDIR /usr/src

RUN curl -fsSL -o ./hytale_downloader.zip https://downloader.hytale.com/hytale-downloader.zip
RUN mkdir -p "./hytale_downloader"
RUN unzip -o "./hytale_downloader.zip" -d "./hytale_downloader"
RUN ls -al "./hytale_downloader"

COPY ./main.sh .
RUN chmod +x /usr/src/main.sh

ENTRYPOINT ["/usr/src/main.sh"]
