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
mv "$DOWNLOADER_TEMP_DIR/hytale-downloader-linux-amd64" "./downloader"
chmod +x "./downloader"
echo "Extracting Downloader... Done!"
