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
      # Server port
      - "5520:5520/udp"

    volumes:
      # Attach the relative directory 'data' to the container's /data path
      - ./data:/data
```
