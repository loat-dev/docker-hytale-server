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

First start the server using:
```
docker compose up
```

After that authenticate the downloader using the link in the console. The server should now start downloading the server files. After that the server should be started automatically.

> [!WARNING]
> Files will be downloaded even if it doesn't seem to look like it. Just give it some time. This takes some minutes.

You may see a message like this in the console:
```
No server tokens configured. Use /auth login to authenticate.
```

If you are still connected to the container, press <kbd>d</kbd> to detach. Now reattach the container using:
```
docker attach server
```

You should now be able to ender commands to the server. Type the following command to authenticate the server:
```
/auth login device
```

Follow the authentication instructions similar to the downloader.

Now your server is authenticated and you should be able to join. To persist the credentials, so that you dont have to authenticate everytime on startup use:
```
/auth persistence Encrypted
```

To detach again, press <kbd>CTRL</kbd>+<kbd>p</kbd> and then <kbd>CTRL</kbd>+<kbd>q</kbd>.

You can also look up the [Hytale Server Manual](https://support.hytale.com/hc/en-us/articles/45326769420827-Hytale-Server-Manual#authentication) for more information.

## Environment Variables

### `PORT`
Changes the server port.
- Default: 5520

### `MIN_MEMORY`
Set the minimum amount of memory to allocate to the server.
- Default: "1G"

### `MAX_MEMORY`
Set the maximum amount of memory to allocate to the server.
- Default: "4G"

### `ENABLE_DOWNLOAD_NEW_FILES_ON_START`
Enables downloading the server files on startup. If this is enabled, the server will download the latest server files on startup. The server will still download the files if either the `HytaleServer.jar` or `assets.zip` files are missing.
- Default: false

### `ENABLE_PERSISTENT_LOGIN`
This feature is not supported yet.
- Default: true

### `ENABLE_BACKUP`
Enables the build-in backup feature.
- Default: true

### `BACKUP_FREQUENCY`
How often to create a backup.
- Default: 30

### `BACKUP_MAX_COUNT`
How many backups to keep.
- Default: 5

### `EXTRA_ARGS`
Provide additional arguments to the server after all the above arguments.
- Default: ""
