# Docker Hytale Server
Hytale server Docker image.

## Quickstart
### Using `compose.yml`

```yml
services:
  server:
    image: ghcr.io/loat-dev/hytale-server:latest
    pull_policy: daily
    tty: true
    stdin_open: true
    ports:
      - "5520:5520"

    volumes:
      # attach the relative directory 'data' to the container's /data path
      - ./data:/data
```
