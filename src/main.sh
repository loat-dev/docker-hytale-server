#!/bin/sh
set -e

/app/health/set_unhealthy.sh

if [ "$DOWNLOAD_NEW_FILES_ON_START" = "true" ] || [ ! -f "./HytaleServer.jar" ] || [ ! -f "./assets.zip" ]; then
  /app/run_downloader.sh \
    -credentials-path "./.hytale-downloader-credentials.json" \
    -download-path "./assets.zip"
else
  echo "Skipping Downloader, using existing files"
fi

args=""

if [ "$BACKUP_ENABLED" = "true" ]; then
  args="$args --backup --backup-path /backup --backup-frequency $BACKUP_FREQUENCY --backup-max-count $BACKUP_MAX_COUNT"
fi

echo "Set container to \"healthy\""
/app/health/set_healthy.sh

echo "Run Server ..."
java \
  "-Xms$MIN_MEMORY" \
  "-Xmx$MAX_MEMORY" \
  -jar "./HytaleServer.jar" \
  --assets "./assets.zip" \
  --bind "0.0.0.0:$PORT" \
  $args \
  $EXTRA_ARGS
