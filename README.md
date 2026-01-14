# Docker Hytale Server
Hytale server Docker image.

## Quickstart
### Using `compose.yml`

```yml
services:
  server:
    container_name: server
    image: ghcr.io/loat-dev/hytale-server:latest
    pull_policy: daily
    tty: true
    stdin_open: true
    ports:
      # Server port
      - "5520:5520/udp"

    volumes:
      # Attach the relative directory 'data' to the container's /data path
      - ./data:/data
```

First start using:
```
docker compose up
```

After that authenticate the downloader using the link in the console. Now you can open a second console and attach to the running instance using:

```
docker compose attach server
```

Here you also need to verify the server [as required by the Hytale Server Manual](https://support.hytale.com/hc/en-us/articles/45326769420827-Hytale-Server-Manual#authentication)
