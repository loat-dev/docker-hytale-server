#!/bin/sh
set -e

DOWNLOADER_URL="https://downloader.hytale.com/hytale-downloader.zip"

DOWNLOADER_TEMP_DIR="$(mktemp -d)"
trap "rm -rf \"$DOWNLOADER_TEMP_DIR\"" EXIT

echo "Downloading Downloader ..."
echo "  Fetching downloader from \"$DOWNLOADER_URL\", saving it to \"$DOWNLOADER_TEMP_DIR/downloader.zip\""
curl -fsSL -o "$DOWNLOADER_TEMP_DIR/downloader.zip" "$DOWNLOADER_URL"
echo "Downloading Downloader ... Done!"

echo "Extracting Downloader ..."
echo "  Unzipping \"hytale-downloader-linux-amd64\" from \"$DOWNLOADER_TEMP_DIR/downloader.zip\", saving it to \"$DOWNLOADER_TEMP_DIR/hytale-downloader-linux-amd64\""
unzip -q "$DOWNLOADER_TEMP_DIR/downloader.zip" "hytale-downloader-linux-amd64" -d "$DOWNLOADER_TEMP_DIR"
echo "  Moving \"$DOWNLOADER_TEMP_DIR/hytale-downloader-linux-amd64\" to \"./src/downloader\""
mv "$DOWNLOADER_TEMP_DIR/hytale-downloader-linux-amd64" "./src/downloader"
chmod +x "./src/downloader"
echo "Extracting Downloader ... Done!"

rm -rf "$DOWNLOADER_TEMP_DIR"
