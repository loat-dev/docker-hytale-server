#!/bin/sh
set -e

DOWNLOADER_URL="https://downloader.hytale.com/hytale-downloader.zip"

DOWNLOADER_TEMP_DIR="$(mktemp -d)"
trap 'rm -rf "$DOWNLOADER_TEMP_DIR"' EXIT

echo "Downloading Downloader..."
curl -fsSL -o "$DOWNLOADER_TEMP_DIR/downloader.zip" "$DOWNLOADER_URL"
echo "Downloading Downloader... Done!"

echo "Extracting Downloader..."
unzip -q "$DOWNLOADER_TEMP_DIR/downloader.zip" "hytale-downloader-linux-amd64" -d "$DOWNLOADER_TEMP_DIR"
mv "$DOWNLOADER_TEMP_DIR/hytale-downloader-linux-amd64" "$DOWNLOADER_TEMP_DIR/downloader"
chmod +x "$DOWNLOADER_TEMP_DIR/downloader"
echo "Extracting Downloader... Done!"

echo "Run Downloader..."
"$DOWNLOADER_TEMP_DIR/downloader" -download-path "$DOWNLOADER_TEMP_DIR/server.zip"

unzip -q "$DOWNLOADER_TEMP_DIR/server.zip" -d "$DOWNLOADER_TEMP_DIR/server"
ls -al "."
echo "Run Downloader... Done!"

