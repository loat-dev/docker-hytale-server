#!/bin/sh
set -e

./health/set_unhealthy.sh

if [ "$DOWNLOAD_NEW_FILES_ON_START" = "true" ] || [ ! -f "./HytaleServer.jar" ] || [ ! -f "./assets.zip" ]; then
  ./run_downloader.sh \
    -credentials-path "./.hytale-downloader-credentials.json" \
    -download-path "./assets.zip"
else
  echo "Skipping Downloader, using existing files"
fi

echo "Set container to \"healthy\""
./health/set_healthy.sh

echo "Run Server ..."
java \
  -XX:AOTCache="./HytaleServer.aot" \
  -jar "./HytaleServer.jar" \
  --assets "./assets.zip" \
  --bind "0.0.0.0:$PORT" \
  $EXTRA_ARGS
