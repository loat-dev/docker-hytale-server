#!/bin/sh
set -e

rm -f "/app/.healthy"

DOWNLOADER_TEMP_DIR="$(mktemp -d)"

echo "Run Downloader ..."
echo "  Running downloader, saving it to \"$DOWNLOADER_TEMP_DIR/server.zip\""
"/app/downloader" \
  -skip-update-check \
  -credentials-path "./.hytale-downloader-credentials.json" \
  -download-path "$DOWNLOADER_TEMP_DIR/server.zip"

echo "  Unzipping files from \"$DOWNLOADER_TEMP_DIR/server.zip\", saving it to \"$DOWNLOADER_TEMP_DIR/server/...\""
unzip -q "$DOWNLOADER_TEMP_DIR/server.zip" -d "$DOWNLOADER_TEMP_DIR/server"

echo "  Copying server files \"$DOWNLOADER_TEMP_DIR/server/Server/...\" to \"/data/...\""
cp -r "$DOWNLOADER_TEMP_DIR/server/Server/." "/data/"

echo "  Copying asset files \"$DOWNLOADER_TEMP_DIR/server/Assets.zip\" to \"/data/assets.zip\""
cp -r "$DOWNLOADER_TEMP_DIR/server/Assets.zip" "/data/assets.zip"

echo "  Cleaning up"
rm -rf "$DOWNLOADER_TEMP_DIR"

echo "Run Downloader ... Done!"

echo "Set container to \"healthy\""
touch "/app/.healthy"

echo "Run Server ..."
java \
  -XX:AOTCache "./HytaleServer.aot" \
  -jar "./HytaleServer.jar" \
  --assets "./assets.zip" \
  --bind "0.0.0.0:$SERVER_PORT"
