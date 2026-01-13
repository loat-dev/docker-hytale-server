FROM eclipse-temurin:25-alpine

EXPOSE 5520

WORKDIR /usr/src

COPY ./main.sh .
RUN chmod +x /usr/src/main.sh

ENTRYPOINT ["/usr/src/main.sh"]
