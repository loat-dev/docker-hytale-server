#!/bin/sh
set -e

DOWNLOADER_TEMP_DIR="$(mktemp -d)"

echo "Run Downloader..."
echo "  Running downloader, saving it to \"$DOWNLOADER_TEMP_DIR/server.zip\""
"/app/downloader" -skip-update-check -download-path "$DOWNLOADER_TEMP_DIR/server.zip"

echo "  Unzipping files from \"$DOWNLOADER_TEMP_DIR/server.zip\", saving it to \"$DOWNLOADER_TEMP_DIR/server/...\""
unzip -q "$DOWNLOADER_TEMP_DIR/server.zip" -d "$DOWNLOADER_TEMP_DIR/server"

ls -al "$DOWNLOADER_TEMP_DIR/server"

echo "Run Downloader... Done!"

